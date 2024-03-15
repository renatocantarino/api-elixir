defmodule ElixirBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params_create [:name, :password, :cep, :email, :document]
  @required_params_update [:name, :email, :cep, :document]

  # @derive {Jason.Encoder, only: [:name, :email]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :cep, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :document, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> do_validatons(@required_params_create)
    |> criptoPassword()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params_create)
    |> do_validatons(@required_params_update)
    |> criptoPassword()
  end

  def do_validatons(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 2)
    |> validate_length(:document, min: 6)
    |> validate_format(:email, ~r/@/)
  end

  defp criptoPassword(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp criptoPassword(changeset), do: changeset
end
