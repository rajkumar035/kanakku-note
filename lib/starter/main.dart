import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kn_pos/login/main.dart';
import 'package:kn_pos/server/db.dart';

class _Starter extends State<MyStarter> {
  final DatabaseServices _databaseServices = DatabaseServices.instance;

  final _entityFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var data = await _databaseServices.getData(_databaseServices.storeDataList);
    if (data.isNotEmpty) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  void handleEntity() async {
    final response = await post(Uri.parse("https://api.kanakunote.com/entity"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "X-Api-Key": "lSHEOIbwcV1lD59EQmAgn50Kj5OoSP438qEU3wNK",
          "x-kn-version": "2.7"
        },
        body: jsonEncode({
          "entityid": _entityFieldController.value.toString(),
          "token": "ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5"
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      await _databaseServices.addData(
          _databaseServices.storeDataList, jsonDecode(data["body"]));
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong, Please try again!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
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
                              padding:
                                  const EdgeInsets.only(top: 100, bottom: 60),
                              child: Image.asset(
                                "assets/images/logo.png",
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
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 255),
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    spreadRadius: 0.0,
                                    blurRadius: 4.0,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                controller: _entityFieldController,
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Please enter some text";
                                  }
                                  return null;
                                },
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
                                if (_entityFieldController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please enter some text"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  handleEntity();
                                }
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
            )));
  }
}

class MyStarter extends StatefulWidget {
  const MyStarter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Starter createState() => _Starter();
}
