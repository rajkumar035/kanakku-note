import 'package:flutter/material.dart';
import 'package:kn_pos/login/main.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600, minHeight: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 140,
                fit: BoxFit.cover,
              ),
              const Text(
                "Quick PoS",
                style: TextStyle(
                    color: Color.fromARGB(255, 88, 86, 214),
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.store,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 60,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 255),
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 255),
                          spreadRadius: 2.0,
                          blurRadius: 10.0,
                          offset: Offset(0, 3))
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Entity code",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color.fromRGBO(0, 0, 0, 255),
                              width: 10.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color.fromRGBO(0, 0, 0, 255),
                              width: 10.0))),
                ),
              ),
              FilledButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text("Get Started"))
            ],
          )),
    ));
  }
}
