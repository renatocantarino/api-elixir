defmodule ElixirBank.Accounts.Transaction do
  alias Ecto.Multi
  alias ElixirBank.Repo
  alias ElixirBank.Accounts
  alias Accounts.Account
  alias Ecto.Multi

  def execute(from_acc, to_acc, value) do
    with %Account{} = from <- Repo.get(Account, from_acc),
         %Account{} = to <- Repo.get(Account, to_acc),
         {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> withDraw(from, value)
      |> deposit(to, value)
      |> Repo.transaction()
    else
      nil -> {:error, :not_found}
      :error -> {:error, "value invalid"}
    end
  end

  defp withDraw(multi, from_acc, value) do
    balance_updated = Decimal.sub(from_acc.balance, value)
    changeset = Account.changeset(from_acc, %{balance: balance_updated})
    Multi.update(multi, :withDraw, changeset)
  end

  defp deposit(multi, to_acc, value) do
    balance_updated = Decimal.add(to_acc.balance, value)
    changeset = Account.changeset(to_acc, %{balance: balance_updated})
    Multi.update(multi, :deposit, changeset)
  end
end
