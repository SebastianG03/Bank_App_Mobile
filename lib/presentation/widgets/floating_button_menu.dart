import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class FloatingButtonMenu extends StatelessWidget {
  const FloatingButtonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: <Widget>[
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}

class FloatingButtonActions {

}