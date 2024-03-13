defmodule ElixirBank.Users.Get do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def execute(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
