import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          splashColor: Colors.green,
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('El meu comptador'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Número de clicks'),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
