import 'package:flutter/material.dart';
import 'dashboard/screens/screens.dart';
import 'screens/screens.dart';

void main() {
    ErrorWidget.builder = (details) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Error:\n${details.exception}',
          style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modather\'s Portfolio ',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), 
    );
  }
}
