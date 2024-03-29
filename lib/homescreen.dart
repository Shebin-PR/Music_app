import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:my_app/Widgets/popupmenu.dart';
import 'package:my_app/libraries/favourites.dart';
import 'package:my_app/libraries/library.dart';
import 'package:my_app/playing/openassetaudio.dart';
import 'package:my_app/playing/play.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'GetX/statecontroller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  List<Audio> audioSongs = [];
  final OnAudioQuery audioQuery = OnAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  TextEditingController name = TextEditingController();

  String searchtext = "";
  List<SongModel>? results;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetBuilder<StateController>(builder: (_controller) {
        if (searchtext.isEmpty) {
          results = _controller.songs.toList();
        }
        return _controller.songs.isNotEmpty
            ? Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
/////////////////////////////////////////////// search /////////////////////////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 370,
                                decoration: ListShadow(),
                                child: TextField(
                                  onChanged: (value) {
                                    searchtext = value;
                                    print(searchtext);
                                    results = _controller.songs
                                        .where((element) => element.title
                                            .toLowerCase()
                                            .contains(searchtext.toLowerCase()))
                                        .toList();
                                    _controller.update();
                                  },
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

///////////////////////////////////////////// L // F // R // S /////////////////////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ////////////////// library ///////////////////////////////
                            Container(
                              width: 85,
                              height: 80,
                              decoration: BlueShadow(),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Library(
                                                    audios: [],
                                                  )),
                                        );
                                        // print("Library pressed");
                                      },
                                      icon: const Icon(
                                          Icons.library_music_rounded)),
                                  Text(
                                    "Library",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),

                            //////////////////// favourites ////////////////
                            Container(
                              width: 85,
                              height: 80,
                              decoration: BlueShadow(),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Favourites()));
                                      // print("favourite pressed");
                                    },
                                    icon: const Icon(Icons.favorite),
                                  ),
                                  Text(
                                    "Liked",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),

                            ////////////////// settings ///////////////////////////////
                            Container(
                              width: 85,
                              height: 80,
                              decoration: BlueShadow(),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Settings()));
                                      // print("settings pressed");
                                    },
                                    icon: const Icon(Icons.settings),
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

//////////////////////////////////////////// all songs ///////////////////////////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8),
                              child: TextButton(
                                  onPressed: () {
                                    // print("Pressed 1");
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
                        SizedBox(height: 1),
/////////////////////////////////////////// songs tiles /////////////////////////////////////////////////////////////////
                        Expanded(
                          child: results != null
                              ? ListView.builder(
                                  padding: EdgeInsets.only(bottom: 85),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: results!.length,
                                  itemBuilder: (context, index) {
                                    audioSongs = results!
                                        .map((element) => Audio.file(
                                            element.uri!,
                                            metas: Metas(
                                                title: element.title,
                                                id: element.id.toString(),
                                                artist: element.artist)))
                                        .toList();
                                    return GestureDetector(
                                      onTap: () {
                                        OpenAssetAudio().openAsset(
                                            index: index, audios: audioSongs);
                                        print(_controller.songs.length);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlayScreen(
                                                    songs: audioSongs,
                                                    audio: _controller.songs,
                                                  )),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 13),
                                        child: Container(
                                          decoration: ListShadow(),
                                          child: ListTile(
                                            title: Text(
                                              results![index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: Text(
                                              results![index].artist ??
                                                  "No Artist",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: PopUpPlayFav(
                                                audio: results![index]),
                                            leading: QueryArtworkWidget(
                                              id: results![index].id,
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
                                )
                              : SizedBox(),
                        )
                      ],
                    ),

                    ///////////////////////// Bottom Recent Song/////////////////////////////////////////////////////////////////
                    assetsAudioPlayer.builderCurrent(
                        builder: (context, Playing? playing) {
                      final myAudios =
                          find(audioSongs, playing!.audio.assetAudioPath);
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 2, right: 2),
                          child: Container(
                            width: 394,
                            height: 80,
                            decoration: BottomShadow(),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlayScreen(
                                              songs: audioSongs,
                                            )));
                              },
                              title: Text(
                                myAudios.metas.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                myAudios.metas.artist ?? "No Artist",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: QueryArtworkWidget(
                                artworkBorder: BorderRadius.circular(100),
                                id: int.parse(myAudios.metas.id!),
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/2.jpg",
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        assetsAudioPlayer.previous();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new_sharp,
                                        color: Colors.black,
                                      )),
                                  PlayerBuilder.isPlaying(
                                    player: assetsAudioPlayer,
                                    builder: (context, isplaying) {
                                      return IconButton(
                                          onPressed: () async {
                                            await assetsAudioPlayer
                                                .playOrPause();
                                          },
                                          icon: Icon(
                                            isplaying
                                                ? Icons.pause_rounded
                                                : Icons.play_arrow_rounded,
                                            size: 30,
                                            color: Colors.black,
                                          ));
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        assetsAudioPlayer.next();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              )
            : Container(
                color: Colors.black,
                child: Center(
                    child: Text(
                  "No Songs found",
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                )),
              );
      })),
    );
  }

////////////////////// Box Decoration//////////////////////////////////////////////////////////
  BoxDecoration BlueShadow() {
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffE4E5E6),
            Color(0xff00416A),
            Color(0xff928DAB),
          ],
        ),
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

  BoxDecoration ListShadow() {
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff00416A),
            Color(0xff928DAB),
          ],
        ),
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

  BoxDecoration BottomShadow() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff283c86),
          Color(0xff45a247),
        ],
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
