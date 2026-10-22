import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/mutations/todos_mutations.dart';

class TodoTile extends ConsumerWidget {
  final Todo todo;

  const TodoTile(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final removeState = ref.watch(removeTodoMutation(todo.id));

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        todo.title,
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0),
      ),
      trailing: switch (removeState) {
        MutationPending() => SizedBox.square(
          dimension: 24.0,
          child: CircularProgressIndicator(),
        ),
        _ => IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.white,
          onPressed: () => removeTodo(ref, todo.id),
        ),
      },
    );
  }
}
