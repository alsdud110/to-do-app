import 'package:flutter/material.dart';
import 'package:to_do_list/data/memory/todo_data_notifier.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;
  const TodoDataHolder(
      {super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder of(BuildContext context) {
    TodoDataHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }
}
