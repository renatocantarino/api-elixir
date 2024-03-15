defmodule ElixirBank.ViaCep.Client do
  use Tesla

  alias ElixirBank.ViaCep.ClientBehavior

  @default_url "https://viacep.com.br/ws"
  plug Tesla.Middleware.JSON

  @behaviour ClientBehavior

  @impl ClientBehavior
  def call(url \\ @default_url, cep) do
    "#{url}/#{cep}/json"
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
