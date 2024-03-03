import 'package:flutter/material.dart';
import 'package:to_do/screens/Home.dart';
import 'package:to_do/screens/Presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do list',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: Presentation(),
      routes: <String, WidgetBuilder>{
        '/presentation': (BuildContext context) => Presentation(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
