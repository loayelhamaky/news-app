import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget{
  static const String routeName = 'settings';

  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(child: Text('Settings',style: TextStyle(fontSize: 35),));
  }

}