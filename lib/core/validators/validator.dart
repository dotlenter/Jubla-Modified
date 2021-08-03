import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

import '../../app/data/datasources/Remote/RemoteDataSource.dart';
import '../errors/exceptions/exception.dart';
import '../network/NetworkInfo.dart';

abstract class Validator {
  Either<String, String> isEmailValid(String email);
  Future<Either<String, String>> isValidUID(String uid);
  Either<String, String> isValidPassword(String password);
  Either<String, String> isValidFullName(String fullName);
  Either<String, String> isEmpty(String value);
}

class ValidatorImpl implements Validator {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ValidatorImpl({
    this.remoteDataSource,
    this.networkInfo,
  });
  @override
  Either<String, String> isEmailValid(String email) =>
      EmailValidator.validate(email) ? right(email) : left('Email is invalid.');
  @override
  Either<String, String> isValidPassword(String password) {
    return password.length >= 6
        ? right(password)
        : left('Password must be at least 6 characters.');
  }

  @override
  Future<Either<String, String>> isValidUID(String uid) async {
    if (uid.length < 6 || uid.isEmpty) {
      return left('Username should be at least 6 characters long.');
    }

    if (await networkInfo.isConnected) {
      try {
        final _emailAndUids = await remoteDataSource.getEmailsAndUids();
        final _checkList = _emailAndUids
            .where((e) =>
                e.uId.toLowerCase() == uid.toLowerCase() ||
                e.userEmail.toLowerCase() == uid.toLowerCase())
            .toList();
        if (_checkList.isNotEmpty) {
          return left('Username already taken.');
        }
        return right(uid);
      } on ServerException {
        return left('Something went wrong with the server');
      } on SocketException {
        return left('SocketLayerExc');
      } on SendTimeoutExc {
        return left('Timeout Error.');
      } on ConnectTimeoutExc {
        return left('Timeout Error.');
      } on RecieveTimeoutExc {
        return left('Timeout Error.');
      } on BadRequestException {
        return left('Timeout Error.');
      }
    } else {
      return left('Network Error.');
    }
  }

  @override
  Either<String, String> isValidFullName(String fullName) {
    if (fullName.isEmpty) {
      return left('Please enter a valid name');
    }
    return right(fullName);
  }

  @override
  Either<String, String> isEmpty(String value) =>
      value.isEmpty ? left('This field cannot be empty') : right(value);
}
