// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopularResponse _$PopularResponseFromJson(Map<String, dynamic> json) {
  return _PopularResponse.fromJson(json);
}

/// @nodoc
mixin _$PopularResponse {
  List<MovieJTO> get results => throw _privateConstructorUsedError;

  /// Serializes this PopularResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularResponseCopyWith<PopularResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularResponseCopyWith<$Res> {
  factory $PopularResponseCopyWith(
          PopularResponse value, $Res Function(PopularResponse) then) =
      _$PopularResponseCopyWithImpl<$Res, PopularResponse>;
  @useResult
  $Res call({List<MovieJTO> results});
}

/// @nodoc
class _$PopularResponseCopyWithImpl<$Res, $Val extends PopularResponse>
    implements $PopularResponseCopyWith<$Res> {
  _$PopularResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieJTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularResponseImplCopyWith<$Res>
    implements $PopularResponseCopyWith<$Res> {
  factory _$$PopularResponseImplCopyWith(_$PopularResponseImpl value,
          $Res Function(_$PopularResponseImpl) then) =
      __$$PopularResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieJTO> results});
}

/// @nodoc
class __$$PopularResponseImplCopyWithImpl<$Res>
    extends _$PopularResponseCopyWithImpl<$Res, _$PopularResponseImpl>
    implements _$$PopularResponseImplCopyWith<$Res> {
  __$$PopularResponseImplCopyWithImpl(
      _$PopularResponseImpl _value, $Res Function(_$PopularResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$PopularResponseImpl(
      null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieJTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularResponseImpl implements _PopularResponse {
  const _$PopularResponseImpl(final List<MovieJTO> results)
      : _results = results;

  factory _$PopularResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularResponseImplFromJson(json);

  final List<MovieJTO> _results;
  @override
  List<MovieJTO> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PopularResponse(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of PopularResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularResponseImplCopyWith<_$PopularResponseImpl> get copyWith =>
      __$$PopularResponseImplCopyWithImpl<_$PopularResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularResponseImplToJson(
      this,
    );
  }
}

abstract class _PopularResponse implements PopularResponse {
  const factory _PopularResponse(final List<MovieJTO> results) =
      _$PopularResponseImpl;

  factory _PopularResponse.fromJson(Map<String, dynamic> json) =
      _$PopularResponseImpl.fromJson;

  @override
  List<MovieJTO> get results;

  /// Create a copy of PopularResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularResponseImplCopyWith<_$PopularResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
