import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  ErrorWidget.builder = (details) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Error:\n${details.exception}',
            style: const TextStyle(fontSize: 18),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectProvider())
      ],
      child: MaterialApp(
        title: 'Modather\'s Portfolio',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
              primary: Constants.primaryColor,
            )),
        home: Consumer<ProjectProvider>(builder: (_, projectProvider, child) {
          return FutureBuilder(
            future: projectProvider.init(),
            builder: (_, asyncSnapshot) {
              if (asyncSnapshot.data != null) {
                return const HomeScreen();
              }
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
