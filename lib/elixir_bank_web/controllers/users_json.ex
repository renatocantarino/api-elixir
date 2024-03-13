defmodule ElixirBankWeb.UsersJSON do
  alias ElixirBank.Users.User

  def create(%{user: user}) do
    %{
      data: data(user),
      message: "user criado com sucesso"
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "user atualizado com sucesso", data: data(user)}

  def delete(%{user: user}), do: %{message: "user deletado com sucesso", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      document: user.document,
      email: user.email
    }
  end
end
