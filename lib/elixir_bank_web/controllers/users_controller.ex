defmodule ElixirBankWeb.UsersController do
  use ElixirBankWeb, :controller

  alias ElixirBank.Users
  alias Users.User

  action_fallback ElixirBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
