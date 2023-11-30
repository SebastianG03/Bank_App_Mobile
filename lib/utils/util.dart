import 'dart:math';

import '../model/bank_account.dart';
import '../model/transferencia.dart';
import '../model/user.dart';

class Util {
  static final List<User> _users = List.generate(10, (index) => User(
    idUser: index + 1,
    name: 'User ${index + 1}',
    email: 'user${index + 1}@example.com',
    password: 'password',
    phone: '123456789${index + 1}',
    role: 'client',
    dni: '1234567${index + 1}',
  ));

  static final List<BankAccount> _bankAccounts = List.generate(10, (index) => BankAccount(
    idAccount: index + 1,
    idUser: (index % 5) + 1,
    accountNumber: 1000000 + index,
    accountAmount: double.parse((Random().nextDouble() * 500).toStringAsFixed(2)),
  ));

  static final List<Transferencia> _transferencias = List.generate(30, (index) => Transferencia(
    idAccountSender: Random().nextInt(10),
    idAccountReceiver: Random().nextInt(10),
    amount: double.parse((Random().nextDouble() * 325.5).toStringAsFixed(2)),
    dateIssue: DateTime.now(),
  ));

  List<User> get users => _users;
  List<BankAccount> get bankAccounts => _bankAccounts;
  List<Transferencia> get transferencias => _transferencias;
}