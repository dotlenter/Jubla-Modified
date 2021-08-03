// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransactionFailureTearOff {
  const _$TransactionFailureTearOff();

// ignore: unused_element
  InvalidTransactionError invalidTransactionError() {
    return const InvalidTransactionError();
  }

// ignore: unused_element
  InvalidPayAmountError invalidPayAmountError() {
    return const InvalidPayAmountError();
  }

// ignore: unused_element
  EmptyOrderError emptyOrderError() {
    return const EmptyOrderError();
  }

// ignore: unused_element
  InvalidDiscountError invalidDiscountError() {
    return const InvalidDiscountError();
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionFailure = _$TransactionFailureTearOff();

/// @nodoc
mixin _$TransactionFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidTransactionError(),
    @required TResult invalidPayAmountError(),
    @required TResult emptyOrderError(),
    @required TResult invalidDiscountError(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidTransactionError(),
    TResult invalidPayAmountError(),
    TResult emptyOrderError(),
    TResult invalidDiscountError(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidTransactionError(InvalidTransactionError value),
    @required TResult invalidPayAmountError(InvalidPayAmountError value),
    @required TResult emptyOrderError(EmptyOrderError value),
    @required TResult invalidDiscountError(InvalidDiscountError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidTransactionError(InvalidTransactionError value),
    TResult invalidPayAmountError(InvalidPayAmountError value),
    TResult emptyOrderError(EmptyOrderError value),
    TResult invalidDiscountError(InvalidDiscountError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TransactionFailureCopyWith<$Res> {
  factory $TransactionFailureCopyWith(
          TransactionFailure value, $Res Function(TransactionFailure) then) =
      _$TransactionFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionFailureCopyWithImpl<$Res>
    implements $TransactionFailureCopyWith<$Res> {
  _$TransactionFailureCopyWithImpl(this._value, this._then);

  final TransactionFailure _value;
  // ignore: unused_field
  final $Res Function(TransactionFailure) _then;
}

/// @nodoc
abstract class $InvalidTransactionErrorCopyWith<$Res> {
  factory $InvalidTransactionErrorCopyWith(InvalidTransactionError value,
          $Res Function(InvalidTransactionError) then) =
      _$InvalidTransactionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidTransactionErrorCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res>
    implements $InvalidTransactionErrorCopyWith<$Res> {
  _$InvalidTransactionErrorCopyWithImpl(InvalidTransactionError _value,
      $Res Function(InvalidTransactionError) _then)
      : super(_value, (v) => _then(v as InvalidTransactionError));

  @override
  InvalidTransactionError get _value => super._value as InvalidTransactionError;
}

/// @nodoc
class _$InvalidTransactionError implements InvalidTransactionError {
  const _$InvalidTransactionError();

  @override
  String toString() {
    return 'TransactionFailure.invalidTransactionError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidTransactionError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidTransactionError(),
    @required TResult invalidPayAmountError(),
    @required TResult emptyOrderError(),
    @required TResult invalidDiscountError(),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidTransactionError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidTransactionError(),
    TResult invalidPayAmountError(),
    TResult emptyOrderError(),
    TResult invalidDiscountError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidTransactionError != null) {
      return invalidTransactionError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidTransactionError(InvalidTransactionError value),
    @required TResult invalidPayAmountError(InvalidPayAmountError value),
    @required TResult emptyOrderError(EmptyOrderError value),
    @required TResult invalidDiscountError(InvalidDiscountError value),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidTransactionError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidTransactionError(InvalidTransactionError value),
    TResult invalidPayAmountError(InvalidPayAmountError value),
    TResult emptyOrderError(EmptyOrderError value),
    TResult invalidDiscountError(InvalidDiscountError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidTransactionError != null) {
      return invalidTransactionError(this);
    }
    return orElse();
  }
}

abstract class InvalidTransactionError implements TransactionFailure {
  const factory InvalidTransactionError() = _$InvalidTransactionError;
}

/// @nodoc
abstract class $InvalidPayAmountErrorCopyWith<$Res> {
  factory $InvalidPayAmountErrorCopyWith(InvalidPayAmountError value,
          $Res Function(InvalidPayAmountError) then) =
      _$InvalidPayAmountErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidPayAmountErrorCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res>
    implements $InvalidPayAmountErrorCopyWith<$Res> {
  _$InvalidPayAmountErrorCopyWithImpl(
      InvalidPayAmountError _value, $Res Function(InvalidPayAmountError) _then)
      : super(_value, (v) => _then(v as InvalidPayAmountError));

  @override
  InvalidPayAmountError get _value => super._value as InvalidPayAmountError;
}

/// @nodoc
class _$InvalidPayAmountError implements InvalidPayAmountError {
  const _$InvalidPayAmountError();

  @override
  String toString() {
    return 'TransactionFailure.invalidPayAmountError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidPayAmountError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidTransactionError(),
    @required TResult invalidPayAmountError(),
    @required TResult emptyOrderError(),
    @required TResult invalidDiscountError(),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidPayAmountError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidTransactionError(),
    TResult invalidPayAmountError(),
    TResult emptyOrderError(),
    TResult invalidDiscountError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidPayAmountError != null) {
      return invalidPayAmountError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidTransactionError(InvalidTransactionError value),
    @required TResult invalidPayAmountError(InvalidPayAmountError value),
    @required TResult emptyOrderError(EmptyOrderError value),
    @required TResult invalidDiscountError(InvalidDiscountError value),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidPayAmountError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidTransactionError(InvalidTransactionError value),
    TResult invalidPayAmountError(InvalidPayAmountError value),
    TResult emptyOrderError(EmptyOrderError value),
    TResult invalidDiscountError(InvalidDiscountError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidPayAmountError != null) {
      return invalidPayAmountError(this);
    }
    return orElse();
  }
}

abstract class InvalidPayAmountError implements TransactionFailure {
  const factory InvalidPayAmountError() = _$InvalidPayAmountError;
}

/// @nodoc
abstract class $EmptyOrderErrorCopyWith<$Res> {
  factory $EmptyOrderErrorCopyWith(
          EmptyOrderError value, $Res Function(EmptyOrderError) then) =
      _$EmptyOrderErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyOrderErrorCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res>
    implements $EmptyOrderErrorCopyWith<$Res> {
  _$EmptyOrderErrorCopyWithImpl(
      EmptyOrderError _value, $Res Function(EmptyOrderError) _then)
      : super(_value, (v) => _then(v as EmptyOrderError));

  @override
  EmptyOrderError get _value => super._value as EmptyOrderError;
}

/// @nodoc
class _$EmptyOrderError implements EmptyOrderError {
  const _$EmptyOrderError();

  @override
  String toString() {
    return 'TransactionFailure.emptyOrderError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmptyOrderError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidTransactionError(),
    @required TResult invalidPayAmountError(),
    @required TResult emptyOrderError(),
    @required TResult invalidDiscountError(),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return emptyOrderError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidTransactionError(),
    TResult invalidPayAmountError(),
    TResult emptyOrderError(),
    TResult invalidDiscountError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyOrderError != null) {
      return emptyOrderError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidTransactionError(InvalidTransactionError value),
    @required TResult invalidPayAmountError(InvalidPayAmountError value),
    @required TResult emptyOrderError(EmptyOrderError value),
    @required TResult invalidDiscountError(InvalidDiscountError value),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return emptyOrderError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidTransactionError(InvalidTransactionError value),
    TResult invalidPayAmountError(InvalidPayAmountError value),
    TResult emptyOrderError(EmptyOrderError value),
    TResult invalidDiscountError(InvalidDiscountError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyOrderError != null) {
      return emptyOrderError(this);
    }
    return orElse();
  }
}

abstract class EmptyOrderError implements TransactionFailure {
  const factory EmptyOrderError() = _$EmptyOrderError;
}

/// @nodoc
abstract class $InvalidDiscountErrorCopyWith<$Res> {
  factory $InvalidDiscountErrorCopyWith(InvalidDiscountError value,
          $Res Function(InvalidDiscountError) then) =
      _$InvalidDiscountErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidDiscountErrorCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res>
    implements $InvalidDiscountErrorCopyWith<$Res> {
  _$InvalidDiscountErrorCopyWithImpl(
      InvalidDiscountError _value, $Res Function(InvalidDiscountError) _then)
      : super(_value, (v) => _then(v as InvalidDiscountError));

  @override
  InvalidDiscountError get _value => super._value as InvalidDiscountError;
}

/// @nodoc
class _$InvalidDiscountError implements InvalidDiscountError {
  const _$InvalidDiscountError();

  @override
  String toString() {
    return 'TransactionFailure.invalidDiscountError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidDiscountError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult invalidTransactionError(),
    @required TResult invalidPayAmountError(),
    @required TResult emptyOrderError(),
    @required TResult invalidDiscountError(),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidDiscountError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult invalidTransactionError(),
    TResult invalidPayAmountError(),
    TResult emptyOrderError(),
    TResult invalidDiscountError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidDiscountError != null) {
      return invalidDiscountError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult invalidTransactionError(InvalidTransactionError value),
    @required TResult invalidPayAmountError(InvalidPayAmountError value),
    @required TResult emptyOrderError(EmptyOrderError value),
    @required TResult invalidDiscountError(InvalidDiscountError value),
  }) {
    assert(invalidTransactionError != null);
    assert(invalidPayAmountError != null);
    assert(emptyOrderError != null);
    assert(invalidDiscountError != null);
    return invalidDiscountError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult invalidTransactionError(InvalidTransactionError value),
    TResult invalidPayAmountError(InvalidPayAmountError value),
    TResult emptyOrderError(EmptyOrderError value),
    TResult invalidDiscountError(InvalidDiscountError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidDiscountError != null) {
      return invalidDiscountError(this);
    }
    return orElse();
  }
}

abstract class InvalidDiscountError implements TransactionFailure {
  const factory InvalidDiscountError() = _$InvalidDiscountError;
}
