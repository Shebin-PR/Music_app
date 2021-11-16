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

  // Future<void> _handleRefresh() async {
  //   return await Future.delayed(Duration(seconds: 1));
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.pink[100],
        body: Container(
          child: Stack(children: [
            Column(
              children: [
                // const SizedBox(height: 5),

                /////////////////////////////// search ///////////////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 370,
                        decoration: BoxDecoration(
                            // color: Colors.grey[200],
                            color: Color(0XFFEFF3F6),
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

                ////////////////////////// L // F // R // S ////////////////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ////////////////// library ///////////////////////////////
                    Container(
                      width: 85,
                      height: 80,
                      decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(15),
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

                    //////////////////// favourites ////////////////
                    Container(
                      width: 85,
                      height: 80,
                      decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(15),
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
                                      builder: (context) =>
                                          const Favourites()));
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

                    ///////////////////// recent //////////////////////////
                    Container(
                        width: 85,
                        height: 80,
                        decoration: BoxDecoration(
                            // color: Colors.grey[200],
                            color: Color(0XFFEFF3F6),
                            borderRadius: BorderRadius.circular(15),
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
                              icon:
                                  const Icon(Icons.access_time_filled_outlined),
                            ),
                            Text(
                              "Recent",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),

                    ////////////////// settings ///////////////////////////////
                    Container(
                      width: 85,
                      height: 80,
                      decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(15),
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

                /////////////////////////// all songs ////////////////////////////////////////////////////////
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
                                      offset: Offset(0, -10),
                                      color: Colors.black)
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

                /////////////////////// songs tiles /////////////////////////////////////////////////
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 70),
                    physics: BouncingScrollPhysics(),
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
                                    Colors.teal,
                                    // Colors.white70,
                                    Colors.grey,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blueAccent,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 6.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: ListTile(
                              title: Text(
                                songs[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                songs[index].artist ?? "No Artist",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Add to favourites"),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Add to playlists"),
                                    value: 2,
                                  ),
                                ],
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
                ),
              ],
            ),
/////////////////////////// bottom play//////////////////////////////
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 70,
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "A.b.c.d",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "No Artist",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                  ),
                  leading: CircleAvatar(
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
            )
          ]),
        ),
      ),
    );
  }
}
