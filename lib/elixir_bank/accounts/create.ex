defmodule ElixirBank.Accounts.Create do
  alias ElixirBank.Accounts.Account
  alias ElixirBank.Repo

  def execute(params) do
    params
    |> Account.changeset()
    |> Repo.insert()
  end
end
