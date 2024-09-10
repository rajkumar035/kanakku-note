import 'package:flutter/material.dart';
import 'package:kn_pos/profile/main.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            print("Dashboard");
          },
          icon: const Icon(Icons.dashboard)),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          icon: const Icon(Icons.dashboard)),
      IconButton(
          onPressed: () {
            print("Dashboard");
          },
          icon: const Icon(Icons.dashboard)),
      IconButton(
          onPressed: () {
            print("Dashboard");
          },
          icon: const Icon(Icons.dashboard)),
      IconButton(
          onPressed: () {
            print("Dashboard");
          },
          icon: const Icon(Icons.dashboard))
    ]);
  }
}
