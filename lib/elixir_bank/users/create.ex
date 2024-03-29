defmodule ElixirBank.Users.Create do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo
  alias ElixirBank.ViaCep.Client, as: ViaCepClient

  def execute(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:elixir_bank, :via_cep_client, ViaCepClient)
  end
end
