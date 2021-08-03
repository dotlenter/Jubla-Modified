import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_failure.freezed.dart';

@freezed
abstract class RegisterFailure with _$RegisterFailure {
  const factory RegisterFailure.networkError() = NetworkError;
  const factory RegisterFailure.socketError() = SocketError;
  const factory RegisterFailure.invalidTokenError() = InvalidTokenError;
  const factory RegisterFailure.cachingError() = CachingError;
  const factory RegisterFailure.cacheStringNotFoundError() =
      CacheStringNotFoundError;
  const factory RegisterFailure.serverError() = ServerError;
  const factory RegisterFailure.badRequestError() = BadRequestError;
}
