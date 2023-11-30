import 'package:bank_app_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/models.dart';
import '../../theme/theme.dart';
import '../../utils/utils.dart';


class TransferenciasView extends StatefulWidget {

  BankAccount bankAccount;
  User user;

  TransferenciasView({super.key, required this.user, required this.bankAccount});

  @override
  State<TransferenciasView> createState() => _TransferenciasViewState();
}

class _TransferenciasViewState extends State<TransferenciasView> {

  Map<String, String> formValues = {};
  final Util util = Util();

  final FocusNode focusCuentaReceptora = FocusNode();
  final FocusNode focusMonto = FocusNode();

  TextEditingController cuentaReceptoraController = TextEditingController();
  TextEditingController montoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    formValues = {'idEmisor': widget.bankAccount.idAccount.toString()};
  }

  @override
  void dispose() {
    super.dispose();
    focusCuentaReceptora.dispose();
    focusMonto.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormsModels.textForm(controller: cuentaReceptoraController,
                  textInputType: TextInputType.number,
                  focusNode: focusCuentaReceptora
                  ,
                  label: 'Número de cuenta',
                  icon: FontAwesomeIcons.idCard,
                  formProperty: 'cuentaReceptora',
                  formValues: formValues),
              const SizedBox(height: 20,),
              TextFormsModels.textForm(controller: montoController,
                  textInputType: TextInputType.number,
                  focusNode: focusMonto
                  ,
                  label: 'Monto',
                  icon: FontAwesomeIcons.dollarSign,
                  formProperty: 'monto',
                  formValues: formValues),
              const SizedBox(height: 20,),
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
        ),
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
        if (bankAccountReceiver != null && accountReceiver != null) {
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
          cuentaReceptoraController.text = '';
          montoController.text = '';
        } else {
          Alerts.androidAlertDialog(context: context, title: 'Error',
              message: 'La transferencia no pudo ser realizada, verifique los datos');
        }
      } catch (e) {
        Alerts.androidAlertDialog(
            context: context, title: 'No se pudo realizar la transferencia',
            message: 'Por favor, coloque datos correctos');
        return;
      }
    }
  }
}

