import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo.dart';

final todosRepositoryProvider = Provider<TodosRepository>(
  (ref) => TodosRepository(),
);

class TodosRepository {
  final List<Todo> _todos = [
    const Todo(id: 1, title: 'Water the plants'),
    const Todo(id: 2, title: 'Buy some soil'),
    const Todo(id: 3, title: 'Repot the monstera'),
  ];

  var _lastId = 3;

  Future<List<Todo>> get todos async {
    await Future.delayed(const Duration(seconds: 2));

    return List.unmodifiable(_todos);
  }

  Future<Todo> add(String title) async {
    await Future.delayed(const Duration(seconds: 2));

    final todo = Todo(id: ++_lastId, title: title);

    _todos.add(todo);

    return todo;
  }

  Future<void> remove(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    _todos.removeWhere((todo) => todo.id == id);
  }
}
