import 'package:bank_app_mobile/logic/cubit/transferencia_forms/transferencia_cubit.dart';
import 'package:bank_app_mobile/presentation/widgets/inputs/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/theme/theme.dart';
import 'package:bank_app_mobile/infrastructure/model/models.dart';
import 'package:bank_app_mobile/infrastructure/utils/utils.dart' show Util;
import '../../widgets/widgets.dart';


class TransferenciasView extends StatefulWidget {

  late BankAccount bankAccount;
  late User user;
  static const name = 'transferencias';

  TransferenciasView({super.key, required int idUser}) {
    user = Util().users.firstWhere((element) => element.idUser == idUser);
    bankAccount = Util().bankAccounts.firstWhere((element) => element.idUser == user.idUser);
  }

  @override
  State<TransferenciasView> createState() => _TransferenciasViewState();
}

class _TransferenciasViewState extends State<TransferenciasView> {

  Map<String, String> formValues = {};
  final Util util = Util();


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final transferenciaCubit = context.watch<TransferenciaCubit>();
    return SizedBox(
      height: height * 0.5,
      width: width,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: BlocProvider(
          create: (context) => TransferenciaCubit(),
          child: _buildForm(context, transferenciaCubit),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, transferenciaCubit) {
    final amount = transferenciaCubit.state.amount.value;
    final accountNumber = transferenciaCubit.state.accountNumber.value;

    return Form(
      child: Column(
        children: <Widget>[
          TextFormsModel(textInputType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Número de cuenta', icon: Icon(FontAwesomeIcons.idCard), errorText: 'error'),
            onChanged: (String value) {
              formValues['cuentaReceptora'] = value;
              transferenciaCubit.accountNumberChanged(value);
            },),
          const SizedBox(height: 10,),
          TextFormsModel(textInputType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Monto', icon: Icon(FontAwesomeIcons.dollarSign), errorText: 'error')
            , onChanged: (String value) {
              formValues['monto'] = value;
              transferenciaCubit.amountChanged(value);
            },
          ),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButtonModel(model: 2,
                  highlightColor: Colors.transparent,
                  splashColor: CustomTheme.buttonPrimaryGradient,
                  content: 'Transferir',
                  onPressed: () => _transferButtonOnPressed,
                  padding: const EdgeInsets.all(20.0),
                  buttonColor: CustomTheme.buttonPrimary,
                  fontSize: 20,
                  textColor: Colors.white,
                  fontFamily: 'WorkSansBold'),
              const SizedBox(width: 20,),
            ],
          )

        ],
      ),
    );
  }

  void _transferButtonOnPressed() {
    if (formValues['cuentaReceptora'] == null ||
        formValues['cuentaReceptora']!.isEmpty ||
        formValues['monto']!.isEmpty) {
      Alerts.androidAlertDialog(
          context: context, title: 'No se pudo realizar la transferencia',
          message: 'Por favor, llene todos los campos');
    } else {
      try {
        int cuentaReceptora = int.parse(formValues['cuentaReceptora']!);
        double monto = double.parse(formValues['monto']!);
        BankAccount bankAccountReceiver = util.bankAccounts.firstWhere((
            element) => element.accountNumber == cuentaReceptora);
        User accountReceiver = util.users.firstWhere((element) =>
        element.idUser == bankAccountReceiver.idUser);
        widget.bankAccount.accountAmount -= monto;
        bankAccountReceiver.accountAmount += monto;
        util.bankAccounts.remove(bankAccountReceiver);
        util.bankAccounts.remove(widget.bankAccount);
        util.bankAccounts.add(bankAccountReceiver);
        util.bankAccounts.add(widget.bankAccount);
        Alerts.androidAlertDialog(
            context: context, title: 'Transferencia realizada',
            message: 'A realizado exitósamente su transferencia al usuario ${accountReceiver
                .name}');
            } catch (e) {
        Alerts.androidAlertDialog(
            context: context, title: 'No se pudo realizar la transferencia',
            message: 'Por favor, coloque datos correctos');
      }
    }
  }
}

