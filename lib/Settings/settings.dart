import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 50,
                        width: 115,
                        alignment: Alignment.center,
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    offset: Offset(0, -10), color: Colors.black)
                              ],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationThickness: 3,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "About",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms Of Service",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Version 1.0.1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Notification",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.toggle_on_outlined,
                          size: 32,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
