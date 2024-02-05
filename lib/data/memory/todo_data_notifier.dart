import 'package:flutter/material.dart';
import 'package:to_do_list/data/memory/vo_todo.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo);
    print(value[0].title);
    notifyListeners();
  }
}
