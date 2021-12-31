import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/database/datamodel.dart';
import 'package:my_app/database/local.dart';
import 'package:my_app/playing/openassetaudio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'bottommodel.dart';

// ignore: must_be_immutable
class PopUpPlayFav extends StatelessWidget {
  PopUpPlayFav({Key? key, required this.audio}) : super(key: key);
  SongModel audio;

//   @override
//   _PopUpPlayFavState createState() => _PopUpPlayFavState();
// }

// class _PopUpPlayFavState extends State<PopUpPlayFav> {
  Box fav = Boxes.getSongsDb();
  @override
  Widget build(BuildContext context) {
    List<AllSongs> songs = fav.get("music");
    Box box = Hive.box('playlist');
    List favourites = box.get("favourites");

    final temp = OpenAssetAudio()
        .findSongFromDatabase(songs, audio.id.toString());

    return PopupMenuButton(
      itemBuilder: (context) => [
        favourites
                .where((element) => element.id.toString() == temp.id.toString())
                .isEmpty
            ? PopupMenuItem(
                onTap: () async {
                  favourites.add(temp);
                  await box.put("favourites", favourites);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(temp.title! + "added successfully"),
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
                      content: Text(temp.title! + "removed successfully"),
                    ),
                  );
                },
                child: Text("Remove from favourite"),
              ),
        PopupMenuItem(
          child: Text("Add to playlists"),
          value: "2",
        ),
      ],
      onSelected: (value) {
        if (value == "2") {
          showModalBottomSheet(
              context: context,
              builder: (context) => BottomPopUp(audio: audio));
        }
      },
    );
  }
}
