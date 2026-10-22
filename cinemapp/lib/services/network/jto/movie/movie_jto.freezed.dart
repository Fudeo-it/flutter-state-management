// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_jto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieJTO _$MovieJTOFromJson(Map<String, dynamic> json) {
  return _MovieJTO.fromJson(json);
}

/// @nodoc
mixin _$MovieJTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get poster => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;

  /// Serializes this MovieJTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieJTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieJTOCopyWith<MovieJTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieJTOCopyWith<$Res> {
  factory $MovieJTOCopyWith(MovieJTO value, $Res Function(MovieJTO) then) =
      _$MovieJTOCopyWithImpl<$Res, MovieJTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'poster_path') String poster,
      String title,
      String overview});
}

/// @nodoc
class _$MovieJTOCopyWithImpl<$Res, $Val extends MovieJTO>
    implements $MovieJTOCopyWith<$Res> {
  _$MovieJTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieJTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poster = null,
    Object? title = null,
    Object? overview = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieJTOImplCopyWith<$Res>
    implements $MovieJTOCopyWith<$Res> {
  factory _$$MovieJTOImplCopyWith(
          _$MovieJTOImpl value, $Res Function(_$MovieJTOImpl) then) =
      __$$MovieJTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'poster_path') String poster,
      String title,
      String overview});
}

/// @nodoc
class __$$MovieJTOImplCopyWithImpl<$Res>
    extends _$MovieJTOCopyWithImpl<$Res, _$MovieJTOImpl>
    implements _$$MovieJTOImplCopyWith<$Res> {
  __$$MovieJTOImplCopyWithImpl(
      _$MovieJTOImpl _value, $Res Function(_$MovieJTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieJTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poster = null,
    Object? title = null,
    Object? overview = null,
  }) {
    return _then(_$MovieJTOImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieJTOImpl implements _MovieJTO {
  const _$MovieJTOImpl(this.id,
      {@JsonKey(name: 'poster_path') required this.poster,
      required this.title,
      required this.overview});

  factory _$MovieJTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieJTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'poster_path')
  final String poster;
  @override
  final String title;
  @override
  final String overview;

  @override
  String toString() {
    return 'MovieJTO(id: $id, poster: $poster, title: $title, overview: $overview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieJTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poster, title, overview);

  /// Create a copy of MovieJTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieJTOImplCopyWith<_$MovieJTOImpl> get copyWith =>
      __$$MovieJTOImplCopyWithImpl<_$MovieJTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieJTOImplToJson(
      this,
    );
  }
}

abstract class _MovieJTO implements MovieJTO {
  const factory _MovieJTO(final int id,
      {@JsonKey(name: 'poster_path') required final String poster,
      required final String title,
      required final String overview}) = _$MovieJTOImpl;

  factory _MovieJTO.fromJson(Map<String, dynamic> json) =
      _$MovieJTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'poster_path')
  String get poster;
  @override
  String get title;
  @override
  String get overview;

  /// Create a copy of MovieJTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieJTOImplCopyWith<_$MovieJTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
