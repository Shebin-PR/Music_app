// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:my_app/Widgets/addtoplay.dart';
// import 'package:my_app/database/datamodel.dart';
// import 'package:my_app/database/local.dart';
// import 'package:my_app/playing/notification.dart';

// class AlertPopUp extends StatefulWidget {
//   final String audioId;
//   const AlertPopUp({Key? key, required this.audioId}) : super(key: key);

//   @override
//   _AlertPopUpState createState() => _AlertPopUpState();
// }

// class _AlertPopUpState extends State<AlertPopUp> {
//   Box _box = Boxes.getSongsDb();
//   @override
//   Widget build(BuildContext context) {
//     // List<AllSongs> song = _box.get("music");
//     // List<dynamic> favourites = _box.get("favourites");
//     final temp = OpenAssetAudio().findSongFromDatabase(song, widget.audioId);
//     return PopupMenuButton(
//       itemBuilder: (BuildContext context) => [
//         favourites
//                 .where((element) => element.id.toString() == temp.id.toString())
//                 .isEmpty
//             ? PopupMenuItem(
//                 onTap: () async {
//                   favourites.add(temp);
//                   await _box.put("favourites", favourites);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(temp.title! + " Added to Favourites"),
//                     ),
//                   );
//                 },
//                 child: Text("Add to favourite"),
//               )
//             : PopupMenuItem(
//                 onTap: () async {
//                   favourites.removeWhere(
//                       (element) => element.id.toString() == temp.id.toString());
//                   await _box.put("favourites", favourites);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(temp.title! + " Removed from Favourites"),
//                     ),
//                   );
//                 },
//                 child: Text("Remove from favourite"),
//               ),
//         PopupMenuItem(
//           child: Text("Add to playlist"),
//           value: "1",
//         ),
//       ],
//       onSelected: (value) async {
//         if (value == "1") {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => AddToPlaylist(song: temp),
//           );
//         }
//       },
//       icon: Icon(
//         Icons.more_horiz,
//         color: Colors.white,
//       ),
//     );
//   }
// }
