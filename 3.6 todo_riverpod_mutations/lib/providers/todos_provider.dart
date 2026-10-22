import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/repositories/todos_repository.dart';

final todosProvider = AsyncNotifierProvider<TodosNotifier, List<Todo>>(
  TodosNotifier.new
);

class TodosNotifier extends AsyncNotifier<List<Todo>> {
  @override
  FutureOr<List<Todo>> build() {
    final todosRepository = ref.read(todosRepositoryProvider);

    return todosRepository.todos;
  }

  Future<Todo> add(String title) async {
    final todosRepository = ref.read(todosRepositoryProvider);
    final todo = await todosRepository.add(title);

    state = AsyncData([...?state.value, todo]);

    return todo;
  }

  Future<void> remove(int id) async {
    final todosRepository = ref.read(todosRepositoryProvider);
    await todosRepository.remove(id);

    state = AsyncData([...?state.value?.where((todo) => todo.id != id)]);
  }
}
