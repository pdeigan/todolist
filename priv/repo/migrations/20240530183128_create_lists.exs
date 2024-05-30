defmodule Todolist.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :is_complete, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
