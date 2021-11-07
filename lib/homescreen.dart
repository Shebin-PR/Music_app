import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/libraries/favourites.dart';
import 'package:my_app/libraries/library.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();
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
        backgroundColor: Color(0xFFff6e7f),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            // Color(0xFF667db6),
            // Color(0xFF0082c8),
            Color(0xFFff6e7f),
            Color(0xFFbfe9ff),
          ])),
          child: ListView(
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45,
                    width: 200,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Colors.black,
                          filled: true,
                          hintText: "Songs",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 25,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                              print("cleared");
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.grey,
                              size: 25,
                            ),
                          )),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Library()),
                          );
                          print("Library pressed");
                        },
                        icon: const Icon(Icons.library_music_rounded)),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Favourites()));
                        print("favourite pressed");
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        print("settings pressed");
                      },
                      icon: const Icon(Icons.settings),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.transparent),
                      )),
                ],
              ),
              // FutureBuilder<List<SongModel>>(
              //   future: _audioQuery.querySongs(
              //     sortType: null,
              //     orderType: OrderType.ASC_OR_SMALLER,
              //     uriType: UriType.EXTERNAL,
              //     ignoreCase: true,
              //   ),
              //   builder: (context, item) {
              //     if (item.data == null) {
              //       return const CircularProgressIndicator();
              //     }
              //     if (item.data!.isEmpty) return const Text("Nothing found!");

              ListView.builder(physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      assetsAudioPlayer.open(Audio.file(
                        songs[index].uri.toString(),
                      ));
                    },
                    child: ListTile(
                      title: Text(songs[index].title),
                      subtitle: Text(songs[index].artist ?? "No Artist"),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                      leading: QueryArtworkWidget(
                        id: songs[index].id,
                        type: ArtworkType.AUDIO,
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
