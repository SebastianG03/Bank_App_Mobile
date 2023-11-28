import 'package:flutter/material.dart';

class HistorialTransferencias extends StatelessWidget {
  const HistorialTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              const Text('Historial de transferencias'),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text ('Volver')),
            ],
          ),
        ),
      ),
    );
  }
}
