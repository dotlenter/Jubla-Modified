part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required bool isLoggingIn,
    @required bool isCreatingAcct,
    @required bool isLoadingSession,
    @required bool isActiveSession,
    @required bool isCheckingUid,
    @required String regUserName,
    @required String regUserNameError,
    @required String regPassword,
    @required String regPasswordError,
    @required String regFullName,
    @required String regFullNameError,
    @required String regPhone,
    @required String regPhoneError,
    @required String userName,
    @required String passWord,
  }) = _AuthState;

  // ignore: prefer_const_constructors
  factory AuthState.initial() => AuthState(
        isLoggingIn: false,
        isCreatingAcct: false,
        isLoadingSession: false,
        isActiveSession: false,
        isCheckingUid: false,
        regUserName: '',
        regUserNameError: 'Email is invalid.',
        regPassword: '',
        regPasswordError: 'Password must be at least 6 characters long.',
        regFullName: '',
        regFullNameError: 'Full name must not be empty',
        regPhone: '',
        regPhoneError: 'Invalid Phone number.',
        userName: '',
        passWord: '',
      );
}
