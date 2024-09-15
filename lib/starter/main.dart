import 'package:flutter/material.dart';
import 'package:kn_pos/login/main.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, minHeight: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 60),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text(
                        "Quick PoS",
                        style: TextStyle(
                            color: Color.fromRGBO(56, 56, 57, 1),
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Icon(
                        Icons.store,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 60,
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 255),
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 0.0,
                            blurRadius: 10.0,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Entity code",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(61, 101, 124, 1)),
                      ),
                      child: const Text("Get Started")),
                )
              ],
            )),
      ),
    ));
  }
}
