import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      height: 50,
                      width: 125,
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
                      child: const Text(
                        "Favourites",
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
                          print("back pressed");
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  ),
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
