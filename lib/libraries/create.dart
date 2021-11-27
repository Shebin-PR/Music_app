import 'package:flutter/material.dart';

class CreateNewPlaylist extends StatefulWidget {
  const CreateNewPlaylist({Key? key}) : super(key: key);

  @override
  _CreateNewPlaylistState createState() => _CreateNewPlaylistState();
}

class _CreateNewPlaylistState extends State<CreateNewPlaylist> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
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
            const TextStyle(color: Colors.grey, fontSize: 20, letterSpacing: 1),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
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
          child: const Text(
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
    );
  }
}
