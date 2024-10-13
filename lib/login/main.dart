import 'package:flutter/material.dart';
import 'package:kn_pos/main/main.dart';
import 'package:kn_pos/server/db.dart';

// ignore: must_be_immutable
class _MyLogin extends State<Login> {
  final DatabaseServices _databaseServices = DatabaseServices.instance;
  // ignore: prefer_typing_uninitialized_variables
  var storename = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var data = await _databaseServices.getData(_databaseServices.storeDataList);
    setState(() {
      storename = data[0]["tenant"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 900, maxHeight: 900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",
                height: 140, fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, top: 30),
              child: Text(
                "Quick PoS",
                style: TextStyle(
                    color: Color.fromRGBO(56, 56, 57, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Color.fromRGBO(57, 57, 58, 1),
                    ),
                    Container(
                      width: 290,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 255),
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 0.0,
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          filled: true,
                          hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 0.4)),
                          fillColor: Colors.white,
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
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock,
                        size: 30,
                        color: Color.fromRGBO(57, 57, 58, 1),
                      ),
                      Container(
                        width: 290,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 255),
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              spreadRadius: 0.0,
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.4)),
                            fillColor: Colors.white,
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
                  TextButton(
                      onPressed: () {
                        print("forgot password");
                      },
                      child: const Text(
                        "Forgot your password ?",
                        style: TextStyle(
                            color: Color.fromRGBO(57, 57, 58, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ))
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(61, 101, 124, 1))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 140,
                    height: 35,
                    child: FilledButton(
                        onPressed: () {
                          print("facebook");
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(61, 101, 124, 1))),
                        child: const Text(
                          "Facebook",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 140,
                    height: 35,
                    child: FilledButton(
                        onPressed: () {
                          print("google");
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(52, 120, 240, 1))),
                        child: const Text(
                          "Google",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.store,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      storename,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    ));
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLogin createState() => _MyLogin();
}
