import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/database/datamodel.dart';
import 'package:my_app/database/local.dart';
import 'package:my_app/playing/notification.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'bottommodel.dart';

class PopUpPlayFav extends StatefulWidget {
  PopUpPlayFav({Key? key, required this.audio}) : super(key: key);
  SongModel audio;

  @override
  _PopUpPlayFavState createState() => _PopUpPlayFavState();
}

class _PopUpPlayFavState extends State<PopUpPlayFav> {
  Box fav = Boxes.getSongsDb();
  @override
  Widget build(BuildContext context) {
    List<AllSongs> songs = fav.get("music");
    Box box = Hive.box('playlist');
    List favourites = box.get("favourites");
    print(favourites);
    final temp = OpenAssetAudio()
        .findSongFromDatabase(songs, widget.audio.id.toString());
    dynamic id = widget.audio.id;
    print(id);
    return PopupMenuButton(
      itemBuilder: (context) => [
        favourites
                .where((element) => element.id.toString() == temp.id.toString())
                .isEmpty
            ?
        PopupMenuItem(
          onTap: () async {
            favourites.add(temp);
            await box.put("favourites", favourites);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(temp.title! + " Added to Favourites"),
              ),
            );
          },
          child: Text("Add to favourite"),
        )
        : PopupMenuItem(
            onTap: () async {
              favourites.removeWhere(
                  (element) => element.id.toString() == temp.id.toString());
              await box.put("favourites", favourites);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(temp.title! + " Removed from Favourites"),
                ),
              );
            },
            child: Text("Remove from favourite"),
          ),
        // PopupMenuItem(
        //   child: Text("Add to Favourites"),
        //   value: "1",
        // ),
        PopupMenuItem(
          child: Text("Add to playlists"),
          value: "2",
        ),
      ],
      onSelected: (value) {
        // if (value == "1") {
        //   print("1111");
        // }
        if (value == "2") {
          showModalBottomSheet(
              context: context,
              builder: (context) => BottomPopUp(audio: widget.audio));
        }
      },
    );
  }
}
