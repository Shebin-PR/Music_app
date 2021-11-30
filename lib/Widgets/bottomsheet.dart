// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class bottomPop extends StatefulWidget {
//   bottomPop({Key? key, required this.name}) : super(key: key);
//   final name;

//   @override
//   _bottomPopState createState() => _bottomPopState();
// }

// class _bottomPopState extends State<bottomPop> {
//   Box playlistbox = Hive.box('playlist');
//   List<dynamic> a = [];
//   @override
//   Widget build(BuildContext context) {
//     Box databox = Hive.box('songbox');
//     List<dynamic> allsongsfromhive = databox.get('allsongs');
//     List<dynamic> playlist = playlistbox.get(widget.name);
//     return ListView.builder(
//       physics: ScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       itemCount: allsongsfromhive.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: QueryArtworkWidget(
//             nullArtworkWidget:
//                 Image.asset("assets/images/2.jpg"),
//             id: allsongsfromhive[index]['id'],
//             type: ArtworkType.AUDIO,
//           ),
//           title: Text(
//             allsongsfromhive[index]['title'],
//             style: TextStyle(color: Colors.black),
//           ),
//           trailing: playlist
//                   .where((element) =>
//                       element["id"].toString() ==
//                       allsongsfromhive[index]["id"].toString())
//                   .isEmpty
//               ? GestureDetector(
//                   onTap: () {
//                     playlist.add(allsongsfromhive[index]);
//                     playlistbox.put(widget.name, playlist);
//                     setState(() {});
//                   },
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.black,
//                   ),
//                 )
//               : GestureDetector(
//                   onTap: () {
//                     playlist.removeWhere((element) =>
//                         element['id'].toString() ==
//                         allsongsfromhive[index]['id'].toString());
//                     playlistbox.put(widget.name, playlist);
//                     setState(() {});
//                   },
//                   child: Icon(
//                     Icons.check_box,
//                     color: Colors.black,
//                   ),
//                 ),
//         );
//       },
//     );
//   }
// }
