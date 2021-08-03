// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'register_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegisterFailureTearOff {
  const _$RegisterFailureTearOff();

// ignore: unused_element
  NetworkError networkError() {
    return const NetworkError();
  }

// ignore: unused_element
  SocketError socketError() {
    return const SocketError();
  }

// ignore: unused_element
  InvalidTokenError invalidTokenError() {
    return const InvalidTokenError();
  }

// ignore: unused_element
  CachingError cachingError() {
    return const CachingError();
  }

// ignore: unused_element
  CacheStringNotFoundError cacheStringNotFoundError() {
    return const CacheStringNotFoundError();
  }

// ignore: unused_element
  ServerError serverError() {
    return const ServerError();
  }

// ignore: unused_element
  BadRequestError badRequestError() {
    return const BadRequestError();
  }
}

/// @nodoc
// ignore: unused_element
const $RegisterFailure = _$RegisterFailureTearOff();

/// @nodoc
mixin _$RegisterFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RegisterFailureCopyWith<$Res> {
  factory $RegisterFailureCopyWith(
          RegisterFailure value, $Res Function(RegisterFailure) then) =
      _$RegisterFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterFailureCopyWithImpl<$Res>
    implements $RegisterFailureCopyWith<$Res> {
  _$RegisterFailureCopyWithImpl(this._value, this._then);

  final RegisterFailure _value;
  // ignore: unused_field
  final $Res Function(RegisterFailure) _then;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError _value, $Res Function(NetworkError) _then)
      : super(_value, (v) => _then(v as NetworkError));

  @override
  NetworkError get _value => super._value as NetworkError;
}

/// @nodoc
class _$NetworkError implements NetworkError {
  const _$NetworkError();

  @override
  String toString() {
    return 'RegisterFailure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements RegisterFailure {
  const factory NetworkError() = _$NetworkError;
}

/// @nodoc
abstract class $SocketErrorCopyWith<$Res> {
  factory $SocketErrorCopyWith(
          SocketError value, $Res Function(SocketError) then) =
      _$SocketErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$SocketErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $SocketErrorCopyWith<$Res> {
  _$SocketErrorCopyWithImpl(
      SocketError _value, $Res Function(SocketError) _then)
      : super(_value, (v) => _then(v as SocketError));

  @override
  SocketError get _value => super._value as SocketError;
}

/// @nodoc
class _$SocketError implements SocketError {
  const _$SocketError();

  @override
  String toString() {
    return 'RegisterFailure.socketError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SocketError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return socketError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (socketError != null) {
      return socketError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return socketError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (socketError != null) {
      return socketError(this);
    }
    return orElse();
  }
}

abstract class SocketError implements RegisterFailure {
  const factory SocketError() = _$SocketError;
}

/// @nodoc
abstract class $InvalidTokenErrorCopyWith<$Res> {
  factory $InvalidTokenErrorCopyWith(
          InvalidTokenError value, $Res Function(InvalidTokenError) then) =
      _$InvalidTokenErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidTokenErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $InvalidTokenErrorCopyWith<$Res> {
  _$InvalidTokenErrorCopyWithImpl(
      InvalidTokenError _value, $Res Function(InvalidTokenError) _then)
      : super(_value, (v) => _then(v as InvalidTokenError));

  @override
  InvalidTokenError get _value => super._value as InvalidTokenError;
}

/// @nodoc
class _$InvalidTokenError implements InvalidTokenError {
  const _$InvalidTokenError();

  @override
  String toString() {
    return 'RegisterFailure.invalidTokenError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidTokenError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return invalidTokenError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidTokenError != null) {
      return invalidTokenError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return invalidTokenError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidTokenError != null) {
      return invalidTokenError(this);
    }
    return orElse();
  }
}

abstract class InvalidTokenError implements RegisterFailure {
  const factory InvalidTokenError() = _$InvalidTokenError;
}

/// @nodoc
abstract class $CachingErrorCopyWith<$Res> {
  factory $CachingErrorCopyWith(
          CachingError value, $Res Function(CachingError) then) =
      _$CachingErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$CachingErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $CachingErrorCopyWith<$Res> {
  _$CachingErrorCopyWithImpl(
      CachingError _value, $Res Function(CachingError) _then)
      : super(_value, (v) => _then(v as CachingError));

  @override
  CachingError get _value => super._value as CachingError;
}

/// @nodoc
class _$CachingError implements CachingError {
  const _$CachingError();

  @override
  String toString() {
    return 'RegisterFailure.cachingError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CachingError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return cachingError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cachingError != null) {
      return cachingError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return cachingError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cachingError != null) {
      return cachingError(this);
    }
    return orElse();
  }
}

abstract class CachingError implements RegisterFailure {
  const factory CachingError() = _$CachingError;
}

/// @nodoc
abstract class $CacheStringNotFoundErrorCopyWith<$Res> {
  factory $CacheStringNotFoundErrorCopyWith(CacheStringNotFoundError value,
          $Res Function(CacheStringNotFoundError) then) =
      _$CacheStringNotFoundErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$CacheStringNotFoundErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $CacheStringNotFoundErrorCopyWith<$Res> {
  _$CacheStringNotFoundErrorCopyWithImpl(CacheStringNotFoundError _value,
      $Res Function(CacheStringNotFoundError) _then)
      : super(_value, (v) => _then(v as CacheStringNotFoundError));

  @override
  CacheStringNotFoundError get _value =>
      super._value as CacheStringNotFoundError;
}

/// @nodoc
class _$CacheStringNotFoundError implements CacheStringNotFoundError {
  const _$CacheStringNotFoundError();

  @override
  String toString() {
    return 'RegisterFailure.cacheStringNotFoundError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CacheStringNotFoundError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return cacheStringNotFoundError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cacheStringNotFoundError != null) {
      return cacheStringNotFoundError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return cacheStringNotFoundError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cacheStringNotFoundError != null) {
      return cacheStringNotFoundError(this);
    }
    return orElse();
  }
}

abstract class CacheStringNotFoundError implements RegisterFailure {
  const factory CacheStringNotFoundError() = _$CacheStringNotFoundError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc
class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'RegisterFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements RegisterFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $BadRequestErrorCopyWith<$Res> {
  factory $BadRequestErrorCopyWith(
          BadRequestError value, $Res Function(BadRequestError) then) =
      _$BadRequestErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$BadRequestErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $BadRequestErrorCopyWith<$Res> {
  _$BadRequestErrorCopyWithImpl(
      BadRequestError _value, $Res Function(BadRequestError) _then)
      : super(_value, (v) => _then(v as BadRequestError));

  @override
  BadRequestError get _value => super._value as BadRequestError;
}

/// @nodoc
class _$BadRequestError implements BadRequestError {
  const _$BadRequestError();

  @override
  String toString() {
    return 'RegisterFailure.badRequestError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BadRequestError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult invalidTokenError(),
    @required TResult cachingError(),
    @required TResult cacheStringNotFoundError(),
    @required TResult serverError(),
    @required TResult badRequestError(),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return badRequestError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult networkError(),
    TResult socketError(),
    TResult invalidTokenError(),
    TResult cachingError(),
    TResult cacheStringNotFoundError(),
    TResult serverError(),
    TResult badRequestError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (badRequestError != null) {
      return badRequestError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult invalidTokenError(InvalidTokenError value),
    @required TResult cachingError(CachingError value),
    @required TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    @required TResult serverError(ServerError value),
    @required TResult badRequestError(BadRequestError value),
  }) {
    assert(networkError != null);
    assert(socketError != null);
    assert(invalidTokenError != null);
    assert(cachingError != null);
    assert(cacheStringNotFoundError != null);
    assert(serverError != null);
    assert(badRequestError != null);
    return badRequestError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult invalidTokenError(InvalidTokenError value),
    TResult cachingError(CachingError value),
    TResult cacheStringNotFoundError(CacheStringNotFoundError value),
    TResult serverError(ServerError value),
    TResult badRequestError(BadRequestError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (badRequestError != null) {
      return badRequestError(this);
    }
    return orElse();
  }
}

abstract class BadRequestError implements RegisterFailure {
  const factory BadRequestError() = _$BadRequestError;
}
