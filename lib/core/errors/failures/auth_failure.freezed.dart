// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

// ignore: unused_element
  InvalidCredentialError invalidCredentialError() {
    return const InvalidCredentialError();
  }

// ignore: unused_element
  NetworkError networkError() {
    return const NetworkError();
  }

// ignore: unused_element
  SocketError socketError() {
    return const SocketError();
  }

// ignore: unused_element
  CachingError cachingError() {
    return const CachingError();
  }

// ignore: unused_element
  ServerError serverError() {
    return const ServerError();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $InvalidCredentialErrorCopyWith<$Res> {
  factory $InvalidCredentialErrorCopyWith(InvalidCredentialError value,
          $Res Function(InvalidCredentialError) then) =
      _$InvalidCredentialErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidCredentialErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidCredentialErrorCopyWith<$Res> {
  _$InvalidCredentialErrorCopyWithImpl(InvalidCredentialError _value,
      $Res Function(InvalidCredentialError) _then)
      : super(_value, (v) => _then(v as InvalidCredentialError));

  @override
  InvalidCredentialError get _value => super._value as InvalidCredentialError;
}

/// @nodoc
class _$InvalidCredentialError implements InvalidCredentialError {
  const _$InvalidCredentialError();

  @override
  String toString() {
    return 'AuthFailure.invalidCredentialError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidCredentialError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return invalidCredentialError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentialError != null) {
      return invalidCredentialError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return invalidCredentialError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentialError != null) {
      return invalidCredentialError(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialError implements AuthFailure {
  const factory InvalidCredentialError() = _$InvalidCredentialError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
    return 'AuthFailure.networkError()';
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
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
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
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AuthFailure {
  const factory NetworkError() = _$NetworkError;
}

/// @nodoc
abstract class $SocketErrorCopyWith<$Res> {
  factory $SocketErrorCopyWith(
          SocketError value, $Res Function(SocketError) then) =
      _$SocketErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$SocketErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
    return 'AuthFailure.socketError()';
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
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return socketError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
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
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return socketError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (socketError != null) {
      return socketError(this);
    }
    return orElse();
  }
}

abstract class SocketError implements AuthFailure {
  const factory SocketError() = _$SocketError;
}

/// @nodoc
abstract class $CachingErrorCopyWith<$Res> {
  factory $CachingErrorCopyWith(
          CachingError value, $Res Function(CachingError) then) =
      _$CachingErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$CachingErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
    return 'AuthFailure.cachingError()';
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
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return cachingError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
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
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return cachingError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cachingError != null) {
      return cachingError(this);
    }
    return orElse();
  }
}

abstract class CachingError implements AuthFailure {
  const factory CachingError() = _$CachingError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
    return 'AuthFailure.serverError()';
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
    @required TResult invalidCredentialError(),
    @required TResult networkError(),
    @required TResult socketError(),
    @required TResult cachingError(),
    @required TResult serverError(),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidCredentialError(),
    TResult networkError(),
    TResult socketError(),
    TResult cachingError(),
    TResult serverError(),
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
    @required TResult invalidCredentialError(InvalidCredentialError value),
    @required TResult networkError(NetworkError value),
    @required TResult socketError(SocketError value),
    @required TResult cachingError(CachingError value),
    @required TResult serverError(ServerError value),
  }) {
    assert(invalidCredentialError != null);
    assert(networkError != null);
    assert(socketError != null);
    assert(cachingError != null);
    assert(serverError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidCredentialError(InvalidCredentialError value),
    TResult networkError(NetworkError value),
    TResult socketError(SocketError value),
    TResult cachingError(CachingError value),
    TResult serverError(ServerError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}
