defmodule Todolist.TodoListTest do
  use Todolist.DataCase

  alias Todolist.TodoList

  describe "lists" do
    alias Todolist.TodoList.List

    import Todolist.TodoListFixtures

    @invalid_attrs %{name: nil, is_complete: nil}

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert TodoList.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert TodoList.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      valid_attrs = %{name: "some name", is_complete: true}

      assert {:ok, %List{} = list} = TodoList.create_list(valid_attrs)
      assert list.name == "some name"
      assert list.is_complete == true
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoList.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      update_attrs = %{name: "some updated name", is_complete: false}

      assert {:ok, %List{} = list} = TodoList.update_list(list, update_attrs)
      assert list.name == "some updated name"
      assert list.is_complete == false
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoList.update_list(list, @invalid_attrs)
      assert list == TodoList.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = TodoList.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> TodoList.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = TodoList.change_list(list)
    end
  end

  describe "items" do
    alias Todolist.TodoList.Item

    import Todolist.TodoListFixtures

    @invalid_attrs %{description: nil, is_complete: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert TodoList.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert TodoList.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description", is_complete: true}

      assert {:ok, %Item{} = item} = TodoList.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.is_complete == true
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoList.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", is_complete: false}

      assert {:ok, %Item{} = item} = TodoList.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.is_complete == false
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoList.update_item(item, @invalid_attrs)
      assert item == TodoList.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = TodoList.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> TodoList.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = TodoList.change_item(item)
    end
  end
end
