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

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        assetPath: json['assetPath'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'assetPath': assetPath,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        assetPath,
      ];
}
