defmodule Todolist.TodoList.Item do
  alias Todolist.TodoList
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :is_complete, :boolean, default: false
    belongs_to :list, TodoList.List

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:description, :is_complete, :list_id])
    |> validate_required([:description, :is_complete])
  end
end
