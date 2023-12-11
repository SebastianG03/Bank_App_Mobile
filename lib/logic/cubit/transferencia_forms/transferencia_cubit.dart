import 'package:bank_app_mobile/presentation/widgets/inputs/inputs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


part 'transferencia_state.dart';

class TransferenciaCubit extends Cubit<TransferenciaState> {
  TransferenciaCubit() : super(const TransferenciaState());


  void onSubmit() {
    print('Submit $state');
    emit(
        state.copyWith(
          formStatus: FormStatus.validating,
          accountNumber: AccountInput.dirty( state.accountNumber.value),
          amount: AmountInput.dirty( state.amount.value),
          isValid: Formz.validate([state.accountNumber, state.amount]),
        )
    );
  }

  void accountNumberChanged(String value) {
    final AccountInput accountNumber = AccountInput.dirty(value);
    state.copyWith(
      accountNumber: accountNumber,
      isValid: Formz.validate([accountNumber, state.amount]),
    );
  }
  void amountChanged(String value) {
    final AmountInput amount = AmountInput.dirty(value);
    state.copyWith(
      amount: amount,
      isValid: Formz.validate([amount, state.accountNumber]),
    );
  }
}
