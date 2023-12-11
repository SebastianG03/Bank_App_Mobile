part of 'transferencia_cubit.dart';

enum FormStatus { invalid, valid, validating }

class TransferenciaState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final AccountInput accountNumber;
  final AmountInput amount;

  const TransferenciaState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.accountNumber = const AccountInput.pure(),
    this.amount = const AmountInput.pure(),
  });

  TransferenciaState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    AccountInput? accountNumber,
    AmountInput? amount
  }) => TransferenciaState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    accountNumber: accountNumber ?? this.accountNumber,
    amount: amount ?? this.amount
  );

  @override
  List<Object?> get props => [formStatus, isValid, accountNumber, amount];
}
