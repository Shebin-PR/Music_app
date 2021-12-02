import 'package:flutter/material.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';

import 'bottommodel.dart';

class PopUpPlayFav extends StatefulWidget {
  PopUpPlayFav({Key? key, required this.audio}) : super(key: key);
  final audio;

  @override
  _PopUpPlayFavState createState() => _PopUpPlayFavState();
}

class _PopUpPlayFavState extends State<PopUpPlayFav> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == "1") {
          print("1111");
        }
        if (value == "2") {
          showModalBottomSheet(
              context: context, builder: (context) => BottomPopUp(audio: widget.audio));
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Add to Favourites"),
          value: "1",
        ),
        PopupMenuItem(
          child: Text("Add to playlists"),
          value: "2",
        ),
      ],
    );
  }
}
