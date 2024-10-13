import 'package:flutter/material.dart';
import 'package:kn_pos/starter/main.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"), home: const MyStarter());
  }
}
