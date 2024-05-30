defmodule Todolist.TodoList.List do
  alias Todolist.TodoList
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :name, :string
    field :is_complete, :boolean, default: false
    has_many :items, TodoList.Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :is_complete])
    |> validate_required([:name, :is_complete])
  end
end
