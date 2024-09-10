import 'package:flutter/material.dart';
import 'package:kn_pos/footer/main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Profile")],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
