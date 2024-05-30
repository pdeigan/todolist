defmodule Todolist.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :description, :string
      add :is_complete, :boolean, default: false, null: false
      add :list_id, references(:lists, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:items, [:list_id])
  end
end
