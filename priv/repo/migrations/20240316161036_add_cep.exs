defmodule ElixirBank.Repo.Migrations.AddCep do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :cep, :string
    end
  end
end
