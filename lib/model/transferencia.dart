import 'dart:ffi';

class Transferencia {
  int _idAccountSender;
  int _idAccountReceiver;
  double _amount;
  DateTime _dateIssue;

  Transferencia.create(this._idAccountSender, this._idAccountReceiver,
      this._amount, this._dateIssue);

  DateTime get dateIssue => _dateIssue;

  set dateIssue(DateTime value) {
    _dateIssue = value;
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  int get idAccountReceiver => _idAccountReceiver;

  set idAccountReceiver(int value) {
    _idAccountReceiver = value;
  }

  int get idAccountSender => _idAccountSender;

  set idAccountSender(int value) {
    _idAccountSender = value;
  }
}