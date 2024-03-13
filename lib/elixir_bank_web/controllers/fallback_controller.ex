defmodule ElixirBankWeb.FallbackController do
  use ElixirBankWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: ElixirBankWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: ElixirBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
