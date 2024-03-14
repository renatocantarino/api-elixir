defmodule ElixirBankWeb.UsersControllerTest do
  use ElixirBankWeb.ConnCase

  describe "create/2" do
    test "sucess when user create", %{conn: conn} do
      params = %{
        name: "cantarino2",
        document: "011887741",
        email: "vc@eu.com",
        password: "s3!"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "document" => "011887741",
                 "email" => "vc@eu.com",
                 "id" => _id,
                 "name" => "cantarino2"
               },
               "message" => "user criado com sucesso"
             } = response
    end
  end
end
