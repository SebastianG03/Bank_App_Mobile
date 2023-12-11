import 'package:bank_app_mobile/config/theme/theme.dart';
import 'package:bank_app_mobile/infrastructure/model/models.dart' show BankAccount, Transferencia;
import 'package:bank_app_mobile/infrastructure/utils/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../../widgets/widgets.dart';

class HistorialTransferencias extends StatelessWidget {
  late final BankAccount bankAccount;
  static const name = 'historial_transferencias';
  final Util util = Util();
  List<Transferencia> transferencias = [];
  late bool isEmpty;

  HistorialTransferencias({super.key, required int idBankAccount}) {
    bankAccount = util.bankAccounts.firstWhere((element) => element.idAccount == idBankAccount);
    transferencias = util.transferencias.where((element) => element.idAccountSender == bankAccount.idAccount || element.idAccountReceiver == bankAccount.idAccount).toList();
    isEmpty = transferencias.isEmpty ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isEmpty ? _listaVacia(context) : _listaTransferencias(context),
    );
  }

  Widget _listaTransferencias(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomTheme.appBar,),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          child: Column(
            children: <Widget>[
              ListView.separated(
                itemCount: transferencias.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                itemBuilder: (context, i) => ListTile(
                  title: Text(transferencias[i].idAccountReceiver.toString()),
                  subtitle: Text(transferencias[i].amount.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () =>
                      DetallesTransferencia.detallesTransferencia(context: context, transferencia: transferencias[i]),
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        )
    );
  }

  Widget _listaVacia(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('No hay transferencias'),
            ],
          ),
        )
    );
  }
}
