import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
final class User extends Equatable {
  final String fullName;
  final String email;
  final String password;

  const User({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
    fullName,
    email,
    password,
  ];
}
