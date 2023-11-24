import 'dart:ffi';

class BankAccount {
  int _idAccount;
  int _idUser;
  int _accountNumber;
  double _accountAmount;

  BankAccount.create(
      this._idAccount, this._idUser, this._accountNumber, this._accountAmount);

  double get accountAmount => _accountAmount;

  set accountAmount(double value) {
    _accountAmount = value;
  }

  int get accountNumber => _accountNumber;

  set accountNumber(int value) {
    _accountNumber = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  int get idAccount => _idAccount;

  set idAccount(int value) {
    _idAccount = value;
  }
}


