
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/common/login.dart';
import 'package:flutter_mini_project/home/presentation/home.dart';

Future<void> main() async {

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Poppins'),
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const Home(),
    }, 
  ));
}

