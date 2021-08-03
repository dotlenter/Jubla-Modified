import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jubla/core/validators/validator.dart';

import '../../../domain/entities/User/User.dart';
import '../../../domain/repositories/AuthRepository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final Validator validator;
  AuthCubit({this.validator, this.authRepository}) : super(AuthState.initial());

  Future<void> loginWithEmailAndPassword(
    String userName,
    String passWord, {
    Function(User user) onSuccess,
    Function(String errorMsg) onError,
  }) async {
    emit(state.copyWith(isLoggingIn: true));
    final _eitherFailureOrUser =
        await authRepository.loginWithEmailAndPassword(userName, passWord);
    if (_eitherFailureOrUser.isRight()) {
      final _user = _eitherFailureOrUser.fold((_) => null, (user) => user);
      onSuccess(_user);
      emit(state.copyWith(isLoggingIn: false));
    } else {
      final _failure = _eitherFailureOrUser.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoggingIn: false));
      onError('Invalid email or password.');
    }
  }

  Future<void> registerSimple(
    String userName,
    String phoneNum,
    String passWord,
    String fullName, {
    Function(User user) onSuccess,
    Function(String errorMsg) onError,
  }) async {
    emit(state.copyWith(isCreatingAcct: true));
    final _eitherFailureOrCreated = await authRepository.registerSimple(
      userName,
      phoneNum,
      passWord,
      fullName,
    );
    if (_eitherFailureOrCreated.isRight()) {
      final _user = _eitherFailureOrCreated.fold((_) => null, (user) => user);
      emit(state.copyWith(isCreatingAcct: false));
      onSuccess(_user);
    } else {
      final _failure = _eitherFailureOrCreated.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingAcct: false));
      onError('Creating account error # $_failure');
    }
  }

  Future<void> checkActiveUser(
      {Function(User user) onActiveUser, Function() empty}) async {
    emit(state.copyWith(isLoadingSession: true));
    final _eitherFailureOrSuccess = await authRepository.getCurrentUser();
    if (_eitherFailureOrSuccess.isRight()) {
      final _user = _eitherFailureOrSuccess.fold((_) => null, (user) => user);
      emit(state.copyWith(isLoadingSession: false));
      onActiveUser(_user);
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingSession: false));
      empty();
    }
  }

  Future<void> signOut({
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    await authRepository.logout();
    resetAuthStates();
    onSuccess();
  }

  void onUserNameChanged(String value) {
    emit(state.copyWith(userName: value));
  }

  void onPassWordChanged(String value) {
    emit(state.copyWith(passWord: value));
  }

  void onRegPhoneChanged(String value) {
    final _eitherLeftOrRight = validator.isEmpty(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(regPhone: value, regPhoneError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(regPhone: value, regPhoneError: _failure));
    }
  }

  void onRegUsernameChanged(String value) async {
    emit(state.copyWith(isCheckingUid: true));
    final _eitherLeftOrRight2 = await validator.isValidUID(value);
    if (_eitherLeftOrRight2.isRight()) {
      final _eitherLeftOrRight = validator.isEmailValid(value);
      if (_eitherLeftOrRight.isRight()) {
        emit(state.copyWith(regUserName: value, regUserNameError: ''));
        emit(state.copyWith(isCheckingUid: false));
      } else {
        final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
        emit(state.copyWith(regUserName: value, regUserNameError: _failure));
        emit(state.copyWith(isCheckingUid: false));
      }
    } else {
      final _failure = _eitherLeftOrRight2.fold((f) => f, (_) => null);
      emit(state.copyWith(regUserName: value, regUserNameError: _failure));
      emit(state.copyWith(isCheckingUid: false));
    }
  }

  void onRegPasswordChanged(String value) {
    final _eitherLeftOrRight = validator.isValidPassword(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(regPassword: value, regPasswordError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(regPassword: value, regPasswordError: _failure));
    }
  }

  void onRegFullNameChanged(String value) {
    final _eitherLeftOrRight = validator.isValidFullName(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(regFullName: value, regFullNameError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(regFullName: value, regFullNameError: _failure));
    }
  }

  void resetAuthStates() {
    emit(state.copyWith(
      isLoggingIn: false,
      isCreatingAcct: false,
      regUserName: '',
      regPassword: '',
      userName: '',
      passWord: '',
    ));
  }
}
