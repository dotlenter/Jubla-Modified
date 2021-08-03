class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class PermissionDeniedException extends AppException {
  PermissionDeniedException([String message])
      : super(message,
            'A permission is denied, application can\'t run without the said permission.');
}

class LocationException extends AppException {
  LocationException([String message])
      : super(message, 'Location could not be found.');
}

class LocationServiceDisabledException extends AppException {
  LocationServiceDisabledException([String message])
      : super(message,
            'Location service is disabled, could not get a user position.');
}

class ServerException extends AppException {
  ServerException([String message])
      : super(message, 'A server specific exception occured, try again later.');
}

class ForbiddenException extends AppException {
  ForbiddenException([String message]) : super(message, 'Access is forbidden.');
}

class NotFoundException extends AppException {
  NotFoundException([String message])
      : super(message, 'Could not find specific object.');
}

class BadRequestException extends AppException {
  BadRequestException([String message])
      : super(message, 'Request is invalid. Please check again.');
}

class ConflictException extends AppException {
  ConflictException([String message]) : super(message, 'Data conflict.');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String message]) : super(message, 'Unauthorized.');
}

class CacheException extends AppException {
  CacheException([String message])
      : super(message, 'Something went wrong caching.');
}

class ExternalException extends AppException {
  ExternalException([String message])
      : super(message, 'Something went wrong and we can\'t fix it.');
}

class CachedItemNotFoundException extends AppException {
  CachedItemNotFoundException([String message])
      : super(message,
            'Cached item not found, no cached object is saved with the key provided.');
}

class ConnectTimeoutExc extends AppException {
  ConnectTimeoutExc([String message])
      : super(message, 'Connecting to the server failed.');
}

class SendTimeoutExc extends AppException {
  SendTimeoutExc([String message])
      : super(message,
            'It took 3000ms to send data, please check your internet connection and try again.');
}

class RecieveTimeoutExc extends AppException {
  RecieveTimeoutExc([String message])
      : super(message, 'Recieving data from the server failed.');
}
