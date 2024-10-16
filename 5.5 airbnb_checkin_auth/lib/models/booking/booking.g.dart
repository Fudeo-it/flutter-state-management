// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingCWProxy {
  Booking id(String id);

  Booking name(String name);

  Booking guestsCount(int guestsCount);

  Booking assetPath(String assetPath);

  Booking pinCode(String pinCode);

  Booking checkInTime(DateTime? checkInTime);

  Booking checkOutTime(DateTime? checkOutTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Booking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Booking(...).copyWith(id: 12, name: "My name")
  /// ````
  Booking call({
    String? id,
    String? name,
    int? guestsCount,
    String? assetPath,
    String? pinCode,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBooking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBooking.copyWith.fieldName(...)`
class _$BookingCWProxyImpl implements _$BookingCWProxy {
  const _$BookingCWProxyImpl(this._value);

  final Booking _value;

  @override
  Booking id(String id) => this(id: id);

  @override
  Booking name(String name) => this(name: name);

  @override
  Booking guestsCount(int guestsCount) => this(guestsCount: guestsCount);

  @override
  Booking assetPath(String assetPath) => this(assetPath: assetPath);

  @override
  Booking pinCode(String pinCode) => this(pinCode: pinCode);

  @override
  Booking checkInTime(DateTime? checkInTime) => this(checkInTime: checkInTime);

  @override
  Booking checkOutTime(DateTime? checkOutTime) =>
      this(checkOutTime: checkOutTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Booking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Booking(...).copyWith(id: 12, name: "My name")
  /// ````
  Booking call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? guestsCount = const $CopyWithPlaceholder(),
    Object? assetPath = const $CopyWithPlaceholder(),
    Object? pinCode = const $CopyWithPlaceholder(),
    Object? checkInTime = const $CopyWithPlaceholder(),
    Object? checkOutTime = const $CopyWithPlaceholder(),
  }) {
    return Booking(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      guestsCount:
          guestsCount == const $CopyWithPlaceholder() || guestsCount == null
              ? _value.guestsCount
              // ignore: cast_nullable_to_non_nullable
              : guestsCount as int,
      assetPath: assetPath == const $CopyWithPlaceholder() || assetPath == null
          ? _value.assetPath
          // ignore: cast_nullable_to_non_nullable
          : assetPath as String,
      pinCode: pinCode == const $CopyWithPlaceholder() || pinCode == null
          ? _value.pinCode
          // ignore: cast_nullable_to_non_nullable
          : pinCode as String,
      checkInTime: checkInTime == const $CopyWithPlaceholder()
          ? _value.checkInTime
          // ignore: cast_nullable_to_non_nullable
          : checkInTime as DateTime?,
      checkOutTime: checkOutTime == const $CopyWithPlaceholder()
          ? _value.checkOutTime
          // ignore: cast_nullable_to_non_nullable
          : checkOutTime as DateTime?,
    );
  }
}

extension $BookingCopyWith on Booking {
  /// Returns a callable class that can be used as follows: `instanceOfBooking.copyWith(...)` or like so:`instanceOfBooking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingCWProxy get copyWith => _$BookingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as String,
      name: json['name'] as String,
      guestsCount: (json['guestsCount'] as num).toInt(),
      assetPath: json['assetPath'] as String,
      pinCode: json['pinCode'] as String,
      checkInTime: json['checkInTime'] == null
          ? null
          : DateTime.parse(json['checkInTime'] as String),
      checkOutTime: json['checkOutTime'] == null
          ? null
          : DateTime.parse(json['checkOutTime'] as String),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'guestsCount': instance.guestsCount,
      'assetPath': instance.assetPath,
      'pinCode': instance.pinCode,
      'checkInTime': instance.checkInTime?.toIso8601String(),
      'checkOutTime': instance.checkOutTime?.toIso8601String(),
    };
