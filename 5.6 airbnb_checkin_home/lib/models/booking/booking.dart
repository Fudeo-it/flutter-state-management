import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
@CopyWith()
class Booking extends Equatable {
  final String id;
  final String name;
  final int guestsCount;
  final String assetPath;
  final String pinCode;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;

  const Booking({
    required this.id,
    required this.name,
    required this.guestsCount,
    required this.assetPath,
    required this.pinCode,
    required this.checkInTime,
    required this.checkOutTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  @override
  List<Object?> get props => [
    id,
    checkInTime,
    checkOutTime,
  ];
}
