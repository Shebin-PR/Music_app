import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
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
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                    child: const Text(
                      "Settings",
                      style: TextStyle(
                          shadows: [
                            Shadow(offset: Offset(0, -10), color: Colors.black)
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
                  height: 50,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "About",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            const Divider(
              endIndent: 20,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Text(
              "Terms Of Service",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            const Divider(
              endIndent: 20,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Text(
              "Privacy Policy",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            const Divider(
              endIndent: 20,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Text(
              "Version 1.0",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
