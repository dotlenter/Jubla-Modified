import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_failure.freezed.dart';

@freezed
abstract class TransactionFailure with _$TransactionFailure {
  const factory TransactionFailure.invalidTransactionError() =
      InvalidTransactionError;
  const factory TransactionFailure.invalidPayAmountError() =
      InvalidPayAmountError;
  const factory TransactionFailure.emptyOrderError() = EmptyOrderError;
  const factory TransactionFailure.invalidDiscountError() =
      InvalidDiscountError;
}
