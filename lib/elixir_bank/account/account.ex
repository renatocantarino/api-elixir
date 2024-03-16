defmodule ElixirBank.Account.Account do
  use Ecto.Schema
  alias ElixirBank.Users.User
  import Ecto.Changeset

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User
    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, params) do
    account
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
