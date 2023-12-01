
class Transferencia {
  int idAccountSender;
  int idAccountReceiver;
  double amount;
  DateTime? dateIssue = DateTime.now();

  Transferencia({required this.idAccountSender, required this.idAccountReceiver,
    required this.amount, this.dateIssue});


}