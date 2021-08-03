import 'package:freezed_annotation/freezed_annotation.dart';
part 'def_failures.freezed.dart';

@freezed
abstract class DefaultFailure with _$DefaultFailure {
  const factory DefaultFailure.invalidCredentialError() = InvalidCredentialError;
  const factory DefaultFailure.networkError() = NetworkError;
  const factory DefaultFailure.socketError() = SocketError;
  const factory DefaultFailure.cachingError() = CachingError;
  const factory DefaultFailure.serverError() = ServerError;
  const factory DefaultFailure.cachedItemNotFoundError() = CachedItemNotFoundError;
  const factory DefaultFailure.conflictError() = ConflictError;
  const factory DefaultFailure.timeoutError() = TimeoutError;
  const factory DefaultFailure.recieveTimeoutError() = RecieveTimeoutError;
  const factory DefaultFailure.sendTimeoutError() = SendTimeoutError;
}
