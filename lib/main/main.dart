import 'package:flutter/material.dart';
import 'package:kn_pos/analytics/main.dart';
import 'package:kn_pos/cart/main.dart';
import 'package:kn_pos/dashboard/main.dart';
import 'package:kn_pos/footer/main.dart';
import 'package:kn_pos/profile/main.dart';
import 'package:kn_pos/warehouse/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  void switchPages(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  final List<Widget> pages = [
    const Dashboard(),
    const Warehouse(),
    const Cart(),
    const Analytics(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      persistentFooterButtons: [
        Footer(
          onNavigate: (pages) => switchPages(pages),
        )
      ],
    );
  }
}
