defmodule ElixirBank.Repo.Migrations.AddAccts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :balance, :decimal
      add :user_id, references(:users)

      timestamps()
    end

    # create constraint(:accounts, :balance_must_be_positive, check: "balance > 0")
    create unique_index(:accounts, [:user_id])
  end
end
