defmodule ElixirBank.ViaCep.HttpClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws"
  plug Tesla.Middleware.JSON

  def call(cep) do
    "/#{cep}/json"
    |> get()
    |> handler()
  end

  defp handler({:ok, %Tesla.Env{status: 200, body: %{"erro" => true}}}) do
    {:error, :not_found}
  end

  defp handler({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:error, body}
  end

  defp handler({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  defp handler({:error, _}) do
    {:error, :internal_server_error}
  end
end
