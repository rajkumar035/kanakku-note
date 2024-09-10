import 'package:flutter/material.dart';
import 'package:kn_pos/footer/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Dashboard")],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
