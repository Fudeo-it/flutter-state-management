import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String title;

  const Todo({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
