import 'package:flutter/material.dart';
import '../homescreen.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
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
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Favourites",
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
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black,
        //   onPressed: () {
        //     print("fav flo pressed");
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
