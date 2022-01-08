import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/statecontroller.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: GetBuilder<StateController>(builder: (_controller) {
            return Container(
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
                            value: _controller.isSwitched,
                            onChanged: (bool value) {
                              _controller.isSwitched = value;
                              _controller.saveSwitchState(value);
                              _controller.update();

                              if (_controller.isSwitched == true) {
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
                            },
                            inactiveTrackColor: Colors.black12,
                            activeTrackColor: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    /////////////////////////terms of service/////////////////////////////////////
                    allsettings("Terms of service"),
                    const SizedBox(height: 15),

                    //////////////////////privacy policy/////////////////////////////////////////
                    allsettings("Privacy Policy"),
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
                    ///
                    ///

                    Center(
                      heightFactor: 25,
                      child: Text(
                        "Version 2.0.0",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                    // Container(
                    //   height: 50,
                    //   width: 150,
                    //   alignment: Alignment.center,
                    //   decoration: shadowFunction(),
                    //   child: TextButton(
                    //       onPressed: () {
                    //         showAboutDialog(
                    //             context: context,
                    //             applicationName: "Lullaby",
                    //             children: [Text("Version : 2.0.0")]);
                    //       },
                    //       child: Text(
                    //         "Version 2.0.0",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.normal),
                    //       )),
                    // ),
                  ],
                ),
              ),
            );
          })),
    );
  }

  Container allsettings(String text) {
    return Container(
      height: 50,
      width: 150,
      alignment: Alignment.center,
      decoration: shadowFunction(),
      child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          )),
    );
  }

  BoxDecoration shadowFunction() {
    return BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
