import 'package:flutter/material.dart';
import 'package:introui/pages/home_page.dart';
import 'package:introui/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home:  Intropage(),
      routes: {
        HomePage.id:(context0) => HomePage(),
        Intropage.id:(context0) => Intropage(),

      },
    );
  }
}


