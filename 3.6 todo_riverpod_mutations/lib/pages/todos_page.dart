import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/mutations/todos_mutations.dart';
import 'package:todo/providers/todos_provider.dart';
import 'package:todo/widgets/todo_tile.dart';

class TodosPage extends ConsumerStatefulWidget {
  const TodosPage({super.key});

  @override
  ConsumerState<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends ConsumerState<TodosPage> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todosState = ref.watch(todosProvider);
    final addState = ref.watch(addTodoMutation);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Todo',
          style: GoogleFonts.tinos(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 36.0,
          ),
        ),
        toolbarHeight: 80,
      ),
      body: switch (todosState) {
        AsyncError() => Center(
          child: Text(
            'Error fetching todos',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
        ),
        AsyncLoading() => Center(child: CircularProgressIndicator()),
        AsyncData(value: []) => Center(
          child: Text(
            'Nothing to do',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
        ),
        AsyncData(:final value) => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final todo = value[index];

            return TodoTile(todo);
          },
          itemCount: value.length,
        ),
      },
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 100.0,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'What needs to be done?',
                    label: Text('Title'),
                    prefixIcon: Icon(Icons.edit_outlined),
                  ),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  onSubmitted: (_) => _add(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: switch (addState) {
                  MutationPending() => SizedBox.square(
                    dimension: 24.0,
                    child: CircularProgressIndicator(),
                  ),
                  _ => IconButton.filled(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    onPressed: _add,
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _add() {
    final title = _titleController.text;

    if (title.isEmpty) return;

    addTodo(ref, title);

    _titleController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();

    super.dispose();
  }
}
