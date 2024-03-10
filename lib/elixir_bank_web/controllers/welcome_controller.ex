defmodule ElixirBankWeb.WelcomeController do
  use ElixirBankWeb, :controller

  def index(conn, params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem vindo"})
  end
end
