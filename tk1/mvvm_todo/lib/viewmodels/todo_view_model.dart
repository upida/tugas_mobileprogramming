import 'package:flutter/foundation.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodoItem(String name) {
    _todos.add(Todo(name: name, completed: false));
    notifyListeners();
  }

  void toggleTodoCompletion(Todo todo) {
    final index = _todos.indexOf(todo);
    if (index != -1) {
      _todos[index].completed = !_todos[index].completed;
      notifyListeners();
    }
  }

  void deleteTodoItem(Todo todo) {
    _todos.removeWhere((element) => element.name == todo.name);
    notifyListeners();
  }
}
