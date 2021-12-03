import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BottomPopUp extends StatefulWidget {
  BottomPopUp({Key? key, required this.audio}) : super(key: key);
  final audio;
  @override
  _BottomPopUpState createState() => _BottomPopUpState();
}

class _BottomPopUpState extends State<BottomPopUp> {
  TextEditingController name = TextEditingController();
  Box playlist = Hive.box('playlist');

  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.white,
      child: ListView(
        children: [
          TextButton(
              onPressed: () {
                openDialog();
              },
              child: Text(
                "Create New Play",
                style: TextStyle(fontSize: 15, color: Colors.black),
              )),
          playlist.isEmpty
              ? Center(
                  child: SizedBox(),
                )
              : ValueListenableBuilder(
                  valueListenable: Hive.box('playlist').listenable(),
                  builder: (context, Box box, _) {
                    var playlistname = box.keys.toList();
                    playlistname.remove("favourites");
                    return (ListView.separated(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: playlistname.length,
                      shrinkWrap: true,
                      itemBuilder: (context, ind) {
                        var playlistSongs = box.get(playlistname[ind]);
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: shadowFunction(),
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                playlistname[ind],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: .5),
                              ),
                              trailing: playlistSongs
                                      .where((element) =>
                                          element.id.toString() ==
                                          widget.audio.id.toString())
                                      .isEmpty
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.blueGrey,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                      List  playlistSongsp =
                                            box.get(playlistname[ind]);

                                        playlistSongsp.add(widget.audio);

                                        box.put(playlistname[ind].toString(),
                                            playlistSongsp);

                                        setState(() {});
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(
                                        Icons.minimize,
                                        color: Colors.blueGrey,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        playlistSongs.removeWhere(
                                          (element) =>
                                              element.id.toString() ==
                                              widget.audio.id.toString(),
                                        );

                                        box.put(playlistname[ind].toString(),
                                            playlistSongs);

                                        setState(() {});
                                      },
                                    ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => Divider(
                        color: Colors.white,
                      ),
                    ));
                  },
                )
        ],
      ),
    );
  }

  BoxDecoration shadowFunction() {
    return BoxDecoration(
        // color: Colors.grey[200],
        color: Color(0XFFEFF3F6),
        borderRadius: BorderRadius.circular(10),
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
        ]);
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) {
        List<dynamic> samplelist = [];
        return AlertDialog(
          title: const Text(
            "Create New Playlist",
            style: TextStyle(
                letterSpacing: 1,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: name,
            cursorColor: Colors.white,
            style: const TextStyle(
                color: Colors.grey, fontSize: 20, letterSpacing: 1),
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
              onPressed: () async {
                var z = playlist.keys.toList();
                // ignore: unnecessary_null_comparison
                if (name != null) {
                  title = name.text;
                  z.where((element) => element == title).isEmpty
                      ? title!.isNotEmpty
                          ? playlist.put(
                              title,
                              samplelist,
                            )
                          : playlist
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('This name is already exist'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                  setState(() {});
                  Navigator.pop(context, 'OK');
                  // name.clear();
                }
              },
            )
          ],
        );
      });
}
