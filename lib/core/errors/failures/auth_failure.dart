import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidCredentialError() = InvalidCredentialError;
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.socketError() = SocketError;
  const factory AuthFailure.cachingError() = CachingError;
  const factory AuthFailure.serverError() = ServerError;
}
