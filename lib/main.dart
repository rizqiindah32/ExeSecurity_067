import 'package:flutter/material.dart';
import 'package:ucp2/form_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
