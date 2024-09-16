import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 65, bottom: 0, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 26,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.notifications,
                    color: Color.fromRGBO(93, 93, 91, 1),
                    size: 24,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/sample.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KN Manager",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "@knuser",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ))
                      ],
                    ),
                    const Icon(
                      Icons.edit,
                      color: Color.fromRGBO(93, 93, 91, 1),
                      size: 24,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Options",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                spreadRadius: 0.0,
                                blurRadius: 8.0,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: const Icon(
                          Icons.person,
                          size: 20,
                          color: Color.fromRGBO(93, 93, 91, 1),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Account settings",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(223, 223, 223, 1)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                spreadRadius: 0.0,
                                blurRadius: 8.0,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: const Icon(
                          Icons.shield,
                          size: 20,
                          color: Color.fromRGBO(93, 93, 91, 1),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Security",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(223, 223, 223, 1)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                spreadRadius: 0.0,
                                blurRadius: 8.0,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: const Icon(
                          Icons.headset_mic_rounded,
                          size: 20,
                          color: Color.fromRGBO(93, 93, 91, 1),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Help center",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(223, 223, 223, 1)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(61, 101, 124, 1))),
                  onPressed: () {
                    print("logout");
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
