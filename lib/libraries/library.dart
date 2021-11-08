import 'package:flutter/material.dart';
import 'package:my_app/homescreen.dart';
import 'package:my_app/libraries/favourites.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Library",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        print("back pressed");
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favourites()));
                        print("Textbutton pressed");
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Favourites",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     print("Add playlist1");
                      //   },
                      //   icon: Icon(Icons.add_box),
                      // ),
                      TextButton(
                          onPressed: () {
                            print("Textbutton pressed");
                          },
                          child: Text(
                            "Playlist 1",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: .5),
                          )),
                      IconButton(
                        onPressed: () {
                          print("deleted playlist1");
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     print("Add playlist1");
                      //   },
                      //   icon: Icon(Icons.add_box),
                      // ),
                      TextButton(
                          onPressed: () {
                            print("Textbutton pressed");
                          },
                          child: Text(
                            "Playlist 2",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: .5),
                          )),
                      IconButton(
                        onPressed: () {
                          print("deleted playlist1");
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog();
            print("lib float");
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

///////////////////alert box/////////////////////////////

  Future openDialog() => showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              "New Playlist",
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            content: TextField(
              cursorColor: Colors.white,
              style:
                  TextStyle(color: Colors.grey, fontSize: 20, letterSpacing: 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  filled: true,
                  hintText: "Playlist Name",
                  hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1)),
            ),
            actions: [
              TextButton(
                child: Text(
                  "CREATE",
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              )
            ],
          ));
}
