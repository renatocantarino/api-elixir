defmodule ElixirBankWeb.FallbackController do
  use ElixirBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: ElixirBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
