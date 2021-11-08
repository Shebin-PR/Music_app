import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
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
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("back pressed");
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "About",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8),
              Divider(
                endIndent: 20,
                thickness: 1,
              ),
              SizedBox(height: 8),
              Text(
                "Terms Of Service",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8),
              Divider(
                endIndent: 20,
                thickness: 1,
              ),
              SizedBox(height: 8),
              Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8),
              Divider(
                endIndent: 20,
                thickness: 1,
              ),
              SizedBox(height: 8),
              Text(
                "Version 1.0",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      )),
    );
  }
}
