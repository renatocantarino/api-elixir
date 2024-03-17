defmodule ElixirBankWeb.AccountsJSON do
  alias ElixirBank.Accounts.Account

  def create(%{account: account}) do
    %{
      data: data(account),
      message: "conta criado com sucesso"
    }
  end

  def get(%{account: account}), do: %{data: data(account)}

  def update(%{account: account}),
    do: %{message: "user atualizado com sucesso", data: data(account)}

  def delete(%{account: account}),
    do: %{message: "user deletado com sucesso", data: data(account)}

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance,
      user_id: account.user_id
    }
  end
end
