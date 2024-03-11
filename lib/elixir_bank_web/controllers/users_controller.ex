defmodule ElixirBankWeb.UsersController do
  use ElixirBankWeb, :controller

  alias ElixirBank.Users.User
  alias ElixirBank.Users.CreateUser

  action_fallback ElixirBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- CreateUser.execute(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
