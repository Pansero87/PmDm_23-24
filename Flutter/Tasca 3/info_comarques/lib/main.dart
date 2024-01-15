import 'package:flutter/material.dart';
import 'package:info_comarques/screens/login.dart';
import 'package:info_comarques/screens/provincies.dart';
import 'package:info_comarques/screens/comarques.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(
          //  appBar: AppBar(
          //  title: const Text('Material App Bar'),
          //),
          body: Center(child: LoginScreen())

          //ProvinciesScreen
          //ComarquesScreen()),
          ),
    );
  }
}
