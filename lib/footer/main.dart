import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function(int pages) onNavigate;

  const Footer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              onNavigate(0);
            },
            icon: const Icon(Icons.dashboard)),
        IconButton(
            onPressed: () {
              onNavigate(1);
            },
            icon: const Icon(Icons.warehouse)),
        IconButton(
            onPressed: () {
              onNavigate(2);
            },
            icon: const Icon(Icons.shopping_cart_checkout)),
        IconButton(
            onPressed: () {
              onNavigate(3);
            },
            icon: const Icon(Icons.line_axis)),
        IconButton(
            onPressed: () {
              onNavigate(4);
            },
            icon: const Icon(Icons.person))
      ],
    );
  }
}
