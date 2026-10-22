// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMovieEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieEventCopyWith<$Res> {
  factory $MovieEventCopyWith(
          MovieEvent value, $Res Function(MovieEvent) then) =
      _$MovieEventCopyWithImpl<$Res, MovieEvent>;
}

/// @nodoc
class _$MovieEventCopyWithImpl<$Res, $Val extends MovieEvent>
    implements $MovieEventCopyWith<$Res> {
  _$MovieEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchMovieEventImplCopyWith<$Res> {
  factory _$$FetchMovieEventImplCopyWith(_$FetchMovieEventImpl value,
          $Res Function(_$FetchMovieEventImpl) then) =
      __$$FetchMovieEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMovieEventImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$FetchMovieEventImpl>
    implements _$$FetchMovieEventImplCopyWith<$Res> {
  __$$FetchMovieEventImplCopyWithImpl(
      _$FetchMovieEventImpl _value, $Res Function(_$FetchMovieEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchMovieEventImpl implements FetchMovieEvent {
  const _$FetchMovieEventImpl();

  @override
  String toString() {
    return 'MovieEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMovieEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMovieEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchMovieEvent implements MovieEvent {
  const factory FetchMovieEvent() = _$FetchMovieEventImpl;
}

/// @nodoc
mixin _$MovieState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res, MovieState>;
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res, $Val extends MovieState>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialMovieStateImplCopyWith<$Res> {
  factory _$$InitialMovieStateImplCopyWith(_$InitialMovieStateImpl value,
          $Res Function(_$InitialMovieStateImpl) then) =
      __$$InitialMovieStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialMovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$InitialMovieStateImpl>
    implements _$$InitialMovieStateImplCopyWith<$Res> {
  __$$InitialMovieStateImplCopyWithImpl(_$InitialMovieStateImpl _value,
      $Res Function(_$InitialMovieStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialMovieStateImpl implements InitialMovieState {
  const _$InitialMovieStateImpl();

  @override
  String toString() {
    return 'MovieState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialMovieStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialMovieState implements MovieState {
  const factory InitialMovieState() = _$InitialMovieStateImpl;
}

/// @nodoc
abstract class _$$FetchingMovieStateImplCopyWith<$Res> {
  factory _$$FetchingMovieStateImplCopyWith(_$FetchingMovieStateImpl value,
          $Res Function(_$FetchingMovieStateImpl) then) =
      __$$FetchingMovieStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchingMovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$FetchingMovieStateImpl>
    implements _$$FetchingMovieStateImplCopyWith<$Res> {
  __$$FetchingMovieStateImplCopyWithImpl(_$FetchingMovieStateImpl _value,
      $Res Function(_$FetchingMovieStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchingMovieStateImpl implements FetchingMovieState {
  const _$FetchingMovieStateImpl();

  @override
  String toString() {
    return 'MovieState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchingMovieStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingMovieState implements MovieState {
  const factory FetchingMovieState() = _$FetchingMovieStateImpl;
}

/// @nodoc
abstract class _$$FetchedMovieStateImplCopyWith<$Res> {
  factory _$$FetchedMovieStateImplCopyWith(_$FetchedMovieStateImpl value,
          $Res Function(_$FetchedMovieStateImpl) then) =
      __$$FetchedMovieStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Movie> movies});
}

/// @nodoc
class __$$FetchedMovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$FetchedMovieStateImpl>
    implements _$$FetchedMovieStateImplCopyWith<$Res> {
  __$$FetchedMovieStateImplCopyWithImpl(_$FetchedMovieStateImpl _value,
      $Res Function(_$FetchedMovieStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_$FetchedMovieStateImpl(
      null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$FetchedMovieStateImpl implements FetchedMovieState {
  const _$FetchedMovieStateImpl(final List<Movie> movies) : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  String toString() {
    return 'MovieState.fetched(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedMovieStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movies));

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedMovieStateImplCopyWith<_$FetchedMovieStateImpl> get copyWith =>
      __$$FetchedMovieStateImplCopyWithImpl<_$FetchedMovieStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) {
    return fetched(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) {
    return fetched?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class FetchedMovieState implements MovieState {
  const factory FetchedMovieState(final List<Movie> movies) =
      _$FetchedMovieStateImpl;

  List<Movie> get movies;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchedMovieStateImplCopyWith<_$FetchedMovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoneMovieStateImplCopyWith<$Res> {
  factory _$$NoneMovieStateImplCopyWith(_$NoneMovieStateImpl value,
          $Res Function(_$NoneMovieStateImpl) then) =
      __$$NoneMovieStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneMovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$NoneMovieStateImpl>
    implements _$$NoneMovieStateImplCopyWith<$Res> {
  __$$NoneMovieStateImplCopyWithImpl(
      _$NoneMovieStateImpl _value, $Res Function(_$NoneMovieStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoneMovieStateImpl implements NoneMovieState {
  const _$NoneMovieStateImpl();

  @override
  String toString() {
    return 'MovieState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoneMovieStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class NoneMovieState implements MovieState {
  const factory NoneMovieState() = _$NoneMovieStateImpl;
}

/// @nodoc
abstract class _$$ErrorFetchingMovieStateImplCopyWith<$Res> {
  factory _$$ErrorFetchingMovieStateImplCopyWith(
          _$ErrorFetchingMovieStateImpl value,
          $Res Function(_$ErrorFetchingMovieStateImpl) then) =
      __$$ErrorFetchingMovieStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorFetchingMovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$ErrorFetchingMovieStateImpl>
    implements _$$ErrorFetchingMovieStateImplCopyWith<$Res> {
  __$$ErrorFetchingMovieStateImplCopyWithImpl(
      _$ErrorFetchingMovieStateImpl _value,
      $Res Function(_$ErrorFetchingMovieStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorFetchingMovieStateImpl implements ErrorFetchingMovieState {
  const _$ErrorFetchingMovieStateImpl();

  @override
  String toString() {
    return 'MovieState.errorFetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorFetchingMovieStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<Movie> movies) fetched,
    required TResult Function() none,
    required TResult Function() errorFetching,
  }) {
    return errorFetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetching,
    TResult? Function(List<Movie> movies)? fetched,
    TResult? Function()? none,
    TResult? Function()? errorFetching,
  }) {
    return errorFetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<Movie> movies)? fetched,
    TResult Function()? none,
    TResult Function()? errorFetching,
    required TResult orElse(),
  }) {
    if (errorFetching != null) {
      return errorFetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMovieState value) initial,
    required TResult Function(FetchingMovieState value) fetching,
    required TResult Function(FetchedMovieState value) fetched,
    required TResult Function(NoneMovieState value) none,
    required TResult Function(ErrorFetchingMovieState value) errorFetching,
  }) {
    return errorFetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialMovieState value)? initial,
    TResult? Function(FetchingMovieState value)? fetching,
    TResult? Function(FetchedMovieState value)? fetched,
    TResult? Function(NoneMovieState value)? none,
    TResult? Function(ErrorFetchingMovieState value)? errorFetching,
  }) {
    return errorFetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMovieState value)? initial,
    TResult Function(FetchingMovieState value)? fetching,
    TResult Function(FetchedMovieState value)? fetched,
    TResult Function(NoneMovieState value)? none,
    TResult Function(ErrorFetchingMovieState value)? errorFetching,
    required TResult orElse(),
  }) {
    if (errorFetching != null) {
      return errorFetching(this);
    }
    return orElse();
  }
}

abstract class ErrorFetchingMovieState implements MovieState {
  const factory ErrorFetchingMovieState() = _$ErrorFetchingMovieStateImpl;
}
