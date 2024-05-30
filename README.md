# Todo List
Simple to-do list backend in elixir

To run the code, pull down the repo and download dependencies (via mix deps.get).
Run `iex -S mix` to run an iex session and you can see the available API's by pressing tab from the Todolist.TodoList. module. 

You can create a new to do list by running `Todolist.TodoList.create_list(%{})` where the possible contents of the struct are as follows:
 - name: string representation of the name of the list
 - is_complete: boolean representing whether or not the entire list is complete (though that is manually updated by the user at this stage). Defaults to false.

You can add items to the list by creating an item via `Todolist.TodoList.item(%{})` with the following possible fields:
 - description: this is the string description of the task that needs to be done
 - is_complete: another boolean indicating whether or not the task is done. Defaults to false
 - list_id: the id of the list to add the item to

Users can toggle the is_complete field by calling either `Todolist.TodoList.toggle_item_by_id/1` or `Todolist.TodoList.toggle_list_by_id\1` and passing the corresponding item or list id (primary key of the tables). 

Users can view all items on a list by calling `Todolist.TodoList.get_list_items!/1` and passing the list id.

Other CRUD commands are available as APIs to the user as well. 
