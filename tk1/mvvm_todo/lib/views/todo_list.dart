import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_view_model.dart';
import '../models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: viewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = viewModel.todos[index];
          return TodoItem(todo: todo);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context, viewModel),
        tooltip: 'Add a Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context, TodoViewModel viewModel) async {
    final TextEditingController textFieldController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a todo'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: 'Type your todo'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.addTodoItem(textFieldController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context, listen: false);

    return ListTile(
      onTap: () {
        viewModel.toggleTodoCompletion(todo);
      },
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) {
          viewModel.toggleTodoCompletion(todo);
        },
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              todo.name,
              style: todo.completed
                  ? const TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough,
                    )
                  : null,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              viewModel.deleteTodoItem(todo);
            },
          ),
        ],
      ),
    );
  }
}
