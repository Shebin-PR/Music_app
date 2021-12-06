import 'package:flutter/material.dart';
import 'package:my_app/database/datamodel.dart';

class FavouritesIcon extends StatefulWidget {
  FavouritesIcon({Key? key, required this.myAudios, AllSongs? music}) : super(key: key);

  final myAudios;

  @override
  _FavouritesIconState createState() => _FavouritesIconState();
}

class _FavouritesIconState extends State<FavouritesIcon> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
