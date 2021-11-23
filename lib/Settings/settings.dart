import 'package:flutter/cupertino.dart';
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
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSwitched = await prefs.getBool("switchState");
    print(isSwitched);

    return isSwitched != null ? isSwitched : true;
  }

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
                    ////////////////////////////back arrow///////////////////////////
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

                //////////////////////////notification/////////////////////////////////////
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
                      Switch(
                        value: isSwitched,
                        onChanged: (bool value) {
                          setState(() {
                            isSwitched = value;
                            saveSwitchState(value);
                            print('Saved state is $isSwitched');

                            // if (isSwitched == null || isSwitched == true) {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(SnackBar(
                            //     content: Text(
                            //       'Notification turned on!',
                            //       style: TextStyle(color: Colors.white),
                            //     ),
                            //     backgroundColor: Colors.grey[900],
                            //   ));
                            // } else {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(SnackBar(
                            //     content: Text(
                            //       'Notification turned off!',
                            //       style: TextStyle(color: Colors.white),
                            //     ),
                            //     backgroundColor: Colors.grey[900],
                            //   ));
                            // }
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
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "Myuuusic",
                            children: [
                              Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            ]);
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
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "Myuuusic",
                            children: [
                              Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            ]);
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
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "Myuuusic",
                            children: [
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "Myuuusic",
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
          )),
    );
  }
}
