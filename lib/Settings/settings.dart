import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
    getSwitchValues();
  }

  getSwitchValues() async {
    isSwitched = await getSwitchState();
    setState(() {});
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("toggleSwitch", value);
    return prefs.setBool("toggleSwitch", value);
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSwitched = await prefs.getBool("toggleSwitch");

    return isSwitched != null ? isSwitched : true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffE4E5E6),
                  Color(0xff00416A),
                  Color(0xff928DAB),
                ],
              ),
            ),
            child: Padding(
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
                                      offset: Offset(0, -10),
                                      color: Colors.black)
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
                      ////////////////////////////back arrow///////////////////////////
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  //////////////////////////notification/////////////////////////////////////
                  Container(
                    height: 50,
                    width: 150,
                    decoration: shadowFunction(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Notification",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal)),
                        Switch(
                          value: isSwitched,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                              saveSwitchState(value);

                              if (isSwitched == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Restart app for changes..!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.grey[900],
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Restart app for changes..!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.grey[900],
                                ));
                              }
                            });
                          },
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  /////////////////////////terms of service/////////////////////////////////////
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: shadowFunction(),
                    child: TextButton(
                        onPressed: () {
                          // showAboutDialog(
                          //     context: context,
                          //     applicationName: "Lullaby",
                          //     children: [Text("")]);
                        },
                        child: Text(
                          "Terms Of Service",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                  const SizedBox(height: 15),

                  //////////////////////privacy policy/////////////////////////////////////////
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: shadowFunction(),
                    child: TextButton(
                        onPressed: () {
                          // showAboutDialog(
                          // context: context,
                          // applicationName: "Lullaby",
                          // children: [Text("")]);
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                  const SizedBox(height: 15),

                  /////////////////////////about//////////////////////////////////////
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: shadowFunction(),
                    child: TextButton(
                        onPressed: () {
                          showAboutDialog(
                              context: context,
                              applicationName: "Lullaby",
                              children: [
                                Text(
                                  "Lullaby .is a Ad free MP3 Music Player that plays local content.Tiny Music player with Awesome UI, Multi format support, etc. It can fulfill all your need about a local music playing.",
                                  style: TextStyle(color: Colors.black),
                                )
                              ]);
                        },
                        child: Text(
                          "About",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                  const SizedBox(height: 15),

                  //////////////////////version////////////////////////////////////////
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: shadowFunction(),
                    child: TextButton(
                        onPressed: () {
                          showAboutDialog(
                              context: context,
                              applicationName: "Lullaby",
                              children: [Text("Version : 1.0.1")]);
                        },
                        child: Text(
                          "Version 1.0.1",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  BoxDecoration shadowFunction() {
    return BoxDecoration(
      // color: Colors.grey[200],
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
