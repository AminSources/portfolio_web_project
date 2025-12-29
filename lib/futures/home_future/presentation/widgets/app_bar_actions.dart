import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //? open drawer
        Scaffold.of(context).openEndDrawer();
      },
      icon: Icon(Icons.menu_rounded),
    );
  }
}
