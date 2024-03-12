defmodule ElixirBank.Users.Create do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def execute(params) do
    IO.puts("execute")

    params
    |> User.changeset()
    |> Repo.insert()

    # |> handle()
  end

  # defp handle({:ok, user}), do: user
  # defp handle({:error, changeset}), do: changeset
end
