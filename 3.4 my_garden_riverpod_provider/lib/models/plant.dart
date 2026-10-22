import 'package:equatable/equatable.dart';

class Plant extends Equatable {
  final int id;
  final String name;
  final String description;
  final String assetPath;

  const Plant({
    required this.id,
    required this.name,
    required this.description,
    required this.assetPath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        assetPath,
      ];
}
