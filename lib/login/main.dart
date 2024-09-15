import 'package:flutter/material.dart';
import 'package:kn_pos/main/main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 900, maxHeight: 900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png", height: 140, fit: BoxFit.cover),
            const Text(
              "Quick PoS",
              style: TextStyle(
                  color: Color.fromARGB(255, 88, 86, 214),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  size: 60,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "username",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color.fromRGBO(0, 0, 0, 255),
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color.fromRGBO(0, 0, 0, 255),
                          ))),
                ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.password_rounded,
                      size: 60,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "password",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color.fromRGBO(0, 0, 0, 255),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color.fromRGBO(0, 0, 0, 255),
                                ))),
                      ),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      print("forgot password");
                    },
                    child: const Text(
                      "Forgot your password ?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 88, 86, 214),
                          fontSize: 20),
                    ))
              ],
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalDivider(
                    color: Color.fromARGB(255, 245, 247, 248),
                    thickness: 3,
                    width: 100),
                Text("OR",
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 247, 248),
                        fontSize: 22)),
                VerticalDivider(
                    color: Color.fromARGB(255, 245, 247, 248),
                    thickness: 3,
                    width: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      print("facebook");
                    },
                    child: const Text(
                      "Facebook",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    )),
                FilledButton(
                    onPressed: () {
                      print("google");
                    },
                    child: const Text(
                      "Google",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    )),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.store,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 80,
                ),
                Text(
                  "ABC Stores Ltd",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
