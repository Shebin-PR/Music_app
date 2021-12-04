// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/libraries/favourites.dart';
import 'package:my_app/libraries/playlist.dart';

class Library extends StatefulWidget {
  final List<dynamic> audios;

  Library({Key? key, required this.audios}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController name = TextEditingController();
  String? title;
  Box playlist = Hive.box('playlist');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Library",
                      style: TextStyle(
                          shadows: [
                            Shadow(offset: Offset(0, -10), color: Colors.black)
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                          decorationThickness: 3,
                          fontSize: 25,
                          letterSpacing: .7,
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: shadowFunction(),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                          size: 30,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 360,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Favourites()));
                                },
                                child: Text(
                                  "Favourites",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                            Icon(
                              Icons.favorite,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
              playlist.isEmpty
                  ? Center(
                      child: SizedBox(),
                    )
                  : ValueListenableBuilder(
                      valueListenable: Hive.box('playlist').listenable(),
                      builder: (context, Box playlistname, _) {
                        List keys = playlistname.keys.toList();
                        keys.remove("favourites");
                        return (ListView.separated(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: keys.length,
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            return Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Container(
                                decoration: shadowFunction(),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlaylistSongs(
                                          audios: widget.audios,
                                          title:keys[ind] ,
                                        ),
                                      ),
                                    );
                                    print("success");
                                  },
                                  onLongPress: () {
                                    editPlaylist(context, playlistname, ind);
                                  },
                                  title: Text(
                                    keys[ind],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: .5),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      playlistname.deleteAt(ind);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, index) => Divider(
                            color: Colors.blueGrey[100],
                          ),
                        ));
                      },
                    )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton( 
          onPressed: () {
            openDialog();
            print("lib float");
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
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

///////////////////add to playlist/////////////////////////////
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
                            content: const Text('Playlist already exist'),
                            duration: const Duration(seconds: 1),
                          ),
                        );

                  setState(() {});
                  Navigator.pop(context);
                  // name.clear();
                }
              },
            )
          ],
        );
      });

///////////////////edit playlist//////////////////////
  Future<String?> editPlaylist(
      BuildContext context, Box<dynamic> playlistname, int ind) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Edit Playlist",
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              TextField(
                controller: name,
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 20, letterSpacing: 1),
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    fillColor: Colors.black,
                    filled: true,
                    hintText: playlistname.keyAt(ind),
                    hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1)),
              ),
              TextButton(
                onPressed: () async {
                  var y = playlist.get(playlistname.keyAt(ind));
                  var z = playlist.keys.toList();
                  if (name != null) {
                    title = name.text;
                    z.where((element) => element == title).isEmpty
                        ? title!.isNotEmpty
                            ? playlist.put(
                                title,
                                y,
                              )
                            : playlist
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Playlist already exist'),
                              duration: const Duration(seconds: 1),
                            ),
                          );

                    z.where((element) => element == title).isEmpty
                        ? title!.isNotEmpty
                            ? playlist.delete(
                                playlistname.keyAt(ind),
                              )
                            : playlist
                        : playlist;
                  }
                  setState(() {});
                  Navigator.pop(context);
                  // name.clear();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }
}
