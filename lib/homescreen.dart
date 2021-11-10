import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:my_app/libraries/favourites.dart';
import 'package:my_app/libraries/library.dart';
import 'package:my_app/play.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _textController = TextEditingController();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    requestPermission();
    getsong();
  }

  requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  int currentindex = 0;

  List<SongModel> songs = [];

  getsong() async {
    songs = await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFFff6e7f),
        body: Container(
          child: ListView(
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 370,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          // color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blueAccent,
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
                      child: const TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 25,
                            ),
                            contentPadding: EdgeInsets.all(5),
                            border: InputBorder.none,
                            hintText: "Search"),
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 85,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
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
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Library()),
                              );
                              print("Library pressed");
                            },
                            icon: const Icon(Icons.library_music_rounded)),
                        Text(
                          "Library",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 85,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
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
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Favourites()));
                            print("favourite pressed");
                          },
                          icon: const Icon(Icons.favorite),
                        ),
                        Text(
                          "Liked",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: 85,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blueAccent,
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
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              print("recent pressed");
                            },
                            icon: const Icon(Icons.access_time_filled_outlined),
                          ),
                          Text(
                            "Recent",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Container(
                    width: 85,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Settings()));
                            print("settings pressed");
                          },
                          icon: const Icon(Icons.settings),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          print("Pressed 1");
                        },
                        child: const Text(
                          "All Songs",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    offset: Offset(0, -10), color: Colors.black)
                              ],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationThickness: 3,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent),
                        )),
                  ),
                ],
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayScreen(
                                  songModel: songs[index],
                                )),
                      );
                      assetsAudioPlayer.open(
                          Audio.file(
                            songs[index].uri.toString(),
                          ),
                          showNotification: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                // Color(0xFF667db6),
                                // Color(0xFF0082c8),

                                Color(0xFF1c92d2),
                                Color(0xFFf2fcfe),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            color: Colors.grey[200],
                            // color: Color(0XFFEFF3F6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 10.0,
                                // spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              )
                            ]),
                        child: ListTile(
                          title: Text(songs[index].title),
                          // subtitle: Text(songs[index].artist ?? "No Artist"),
                          trailing: IconButton(
                            onPressed: () {
                              print("more pressed");
                            },
                            icon: const Icon(Icons.more_vert_outlined),
                          ),
                          leading: QueryArtworkWidget(
                            id: songs[index].id,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/2.jpg",
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
