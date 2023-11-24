import '../model/bank_account.dart';
import '../model/transferencia.dart';
import '../model/user.dart';

class util {
  List<User> _users = [];
  List<BankAccount> _bankAccounts = [];
  List<Transferencia> _transferencias = [];

  util();

  void generateObjects() {
    for(int i = 0; i < 10; i++) {
      _users.add(User.create(i, 'name $i', 'email $i', 'password $i', 'phone $i', 'role $i', 'dni $i'));
      _bankAccounts.add(BankAccount.create(i, i, i, 100.0));
      _transferencias.add(Transferencia.create(i, i, 100.0, DateTime.now()));
    }
  }

  get users => _users;
  get bankAccounts => _bankAccounts;
  get transferencias => _transferencias;
}