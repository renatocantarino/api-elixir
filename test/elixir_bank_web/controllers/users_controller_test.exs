defmodule ElixirBankWeb.UsersControllerTest do
  use ElixirBankWeb.ConnCase

  import Mox
  setup :verify_on_exit!

  setup do
    params = %{
      "name" => "João",
      "document" => "sasasa",
      "cep" => "29560000",
      "email" => "joao@frutas.com",
      "password" => "123456"
    }

    body = %{
      "bairro" => "",
      "cep" => "29560-000",
      "complemento" => "",
      "ddd" => "28",
      "gia" => "",
      "ibge" => "3202306",
      "localidade" => "Guaçuí",
      "logradouro" => "",
      "siafi" => "5645",
      "uf" => "ES"
    }

    {:ok, %{user_params: params, body: body}}
  end

  describe "create/2" do
    test "successfully creates an user", %{conn: conn, body: body, user_params: params} do
      expect(ElixirBank.ViaCep.ClientMock, :call, fn "29560000" ->
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      IO.inspect(response)

      assert %{
               "data" => %{
                 "cep" => "29560000",
                 "document" => "sasasasa",
                 "email" => "joao@frutas.com",
                 "id" => _id,
                 "name" => "João"
               },
               "message" => "user criado com sucesso"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        document: nil,
        cep: "12",
        email: "joao@frutas.com",
        password: "123456"
      }

      expect(ElixirBank.ViaCep.ClientMock, :call, fn "12" ->
        {:ok, ""}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"document" => ["can't be blank"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end
end
