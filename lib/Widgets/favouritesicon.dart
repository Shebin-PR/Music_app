// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:my_app/database/local.dart';

// class FavouritesIcon extends StatefulWidget {
//   FavouritesIcon({Key? key, required this.myAudios}) : super(key: key);

//   final myAudios;

//   @override
//   _FavouritesIconState createState() => _FavouritesIconState();
// }

// class _FavouritesIconState extends State<FavouritesIcon> {
//   Box box = Boxes.getSongsDb();
//   @override
//   Widget build(BuildContext context) {
//     Box box = Hive.box('playlist');
//     List favourites = box.get("favourites");
//     return favourites
//             .where((element) =>
//                 element.id.toString() == widget.myAudios.metas.id.toString())
//             .isEmpty
//         ? IconButton(
//             onPressed: () async {
//               favourites.add(widget.myAudios);
//               await box.put("favourites", favourites);
//               print("11111111111111111111111111111");
//               print(favourites);
//               setState(() {});
//             },
//             icon: Icon(
//               Icons.favorite_border,
//               color: Colors.red,
//             ))
//         : IconButton(
//             onPressed: () async {
//               favourites.removeWhere((element) =>
//                   element.id.toString() == widget.myAudios.id.toString());
//               await box.put("favourites", favourites);
//               print("11111111111111111111111111111");
//               print(favourites);
//               setState(() {});
//             },
//             icon: Icon(
//               Icons.favorite,
//               color: Colors.black,
//             ));
//   }
// }
