defmodule ElixirBankWeb.UsersJSON do
  alias ElixirBank.Users.User

  def create(%{user: user}) do
    %{
      data: data(user),
      message: "user criado com sucesso"
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
