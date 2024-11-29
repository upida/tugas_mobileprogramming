import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_view_model.dart';
import 'todo_list.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoViewModel(),
      child: MaterialApp(
        title: 'Todo Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoList(title: 'Todo Manager ABC'),
      ),
    );
  }
}
