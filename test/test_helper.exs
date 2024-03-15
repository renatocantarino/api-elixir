Mox.defmock(ElixirBank.ViaCep.ClientMock, for: ElixirBank.ViaCep.ClientBehaviour)
Application.put_env(:elixir_bank, :via_cep_client, ElixirBank.ViaCep.ClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ElixirBank.Repo, :manual)
