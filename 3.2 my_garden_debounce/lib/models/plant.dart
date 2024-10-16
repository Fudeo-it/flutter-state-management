import 'package:equatable/equatable.dart';

class Plant extends Equatable {
  final String name;
  final String assetPath;

  const Plant({
    required this.name,
    required this.assetPath,
  });

  @override
  List<Object?> get props => [
        name,
        assetPath,
      ];
}
