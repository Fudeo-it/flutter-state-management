import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todos_provider.dart';

final addTodoMutation = Mutation<Todo>();

final removeTodoMutation = Mutation<void>();

Future<void> addTodo(MutationTarget ref, String title) async {
  await addTodoMutation.run(
    ref,
    (tsx) => tsx.get(todosProvider.notifier).add(title),
  );
}

Future<void> removeTodo(MutationTarget ref, int id) async {
  await removeTodoMutation(
    id,
  ).run(ref, (tsx) => tsx.get(todosProvider.notifier).remove(id));
}
