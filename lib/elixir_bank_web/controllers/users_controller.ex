defmodule ElixirBankWeb.UsersController do
  use ElixirBankWeb, :controller

  alias ElixirBank.Users.CreateUser

  def create(conn, params) do
    params
    |> CreateUser.execute()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end

  # defp handle_response({:error, _changset} = error, conn) do
  #   conn
  #   |> put_status(:unprocessable_entity)
  #   |> render("error.json", error: error)
  # end
end
