defmodule Todolist.TodoListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.TodoList` context.
  """

  @doc """
  Generate a list.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{
        is_complete: true,
        name: "some name"
      })
      |> Todolist.TodoList.create_list()

    list
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        is_complete: true
      })
      |> Todolist.TodoList.create_item()

    item
  end
end
