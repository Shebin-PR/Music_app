import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import '../libraries/library.dart';

class PlayScreen extends StatefulWidget {
  List<Audio> songs;
  int index;
  PlayScreen({Key? key, required this.songs, required this.index})
      : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  Audio find(List<Audio> source, String fromPath) {
    print("object");
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  void initState() {
    super.initState();
  }

  var duration;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.teal[900],
            body: assetsAudioPlayer.builderCurrent(
                builder: (context, Playing? playing) {
              final myAudios =
                  find(widget.songs, playing!.audio.assetAudioPath);
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white10,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Library()),
                                  );
                                  print("Library pressed");
                                },
                                icon: const Icon(
                                  Icons.library_music_rounded,
                                  color: Colors.black,
                                )),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: .0,
                                      spreadRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white10,
                                      offset: Offset(-1.0, -1.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    )
                                  ]),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    print("back pressed");
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.black,
                                    size: 30,
                                  ))),
                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 180,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 230, 243, 1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              offset: Offset(-5, -5),
                              color: Colors.transparent,
                            ),
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(10.5, 10.5),
                              color: Colors.blueGrey,
                              // color: Color.fromRGBO(214, 223, 230, 1),
                            )
                          ],
                        ),
                        child: Center(
                          child: LayoutBuilder(
                              builder: (context, constraints) => Container(
                                    height: constraints.maxHeight * 0.85,
                                    width: constraints.maxWidth * 0.90,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(203, 211, 196, 1),
                                        Color.fromRGBO(176, 188, 163, 1)
                                      ]),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color.fromRGBO(168, 168, 168, 1),
                                        width: 0,
                                      ),
                                    ),
                                    child: QueryArtworkWidget(
                                      // artworkFit: BoxFit.fitHeight,
                                      artworkFit: BoxFit.fill,
                                      artworkBorder: BorderRadius.circular(8),
                                      id: int.parse(myAudios.metas.id!),
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: CircleAvatar(
                                        radius: 25,
                                        child: Image.asset(
                                          "assets/images/2.jpg",
                                          fit: BoxFit.cover,
                                          width: 235,
                                          height: 235,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      SizedBox(height: 30),
                      /////////////title////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          myAudios.metas.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),

                      /////////////////////////////artist/////////////////////////////////////////////////////////////////////////////
                      Text(myAudios.metas.artist ?? "No Artist"),
                      SizedBox(height: 10),

                      ////////////////seek bar//////////////////////////////////////////////////////////////////////////////////////
                      assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, RealtimePlayingInfos? info) {
                        if (info == null) {
                          return SizedBox();
                        }
                        return Container(
                          width: 310,
                          child: ProgressBar(
                            progress: info.currentPosition,
                            total: info.duration,
                            onSeek: (to) {
                              assetsAudioPlayer.seek(to);
                            },
                            thumbColor: Colors.brown,
                            baseBarColor: Colors.pink[100],
                            thumbGlowColor: Colors.pink[50],
                            progressBarColor: Colors.pink[300],
                          ),
                        );
                      }),
                      ////////////////////controls//////////////////////////////////////////////////////////////
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: .0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white10,
                                    offset: Offset(-1.0, -1.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.previous();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Colors.brown,
                                )),
                          ),
                          PlayerBuilder.isPlaying(
                              player: assetsAudioPlayer,
                              builder: (context, isplaying) {
                                return Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.pink[50],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blueGrey,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: .0,
                                          spreadRadius: 1.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.white10,
                                          offset: Offset(-1.0, -1.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0,
                                        )
                                      ]),
                                  child: IconButton(
                                      onPressed: () async {
                                        await assetsAudioPlayer.playOrPause();
                                      },
                                      icon: Icon(
                                        isplaying
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        size: 32,
                                      )),
                                );
                              }),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: .0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white10,
                                    offset: Offset(-1.0, -1.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: IconButton(
                              onPressed: () {
                                assetsAudioPlayer.next();
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      /////////////////favourites//////////////////////////////////
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(4.0, 4.0),
                                blurRadius: .0,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.white10,
                                offset: Offset(-1.0, -1.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              )
                            ]),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            })));
  }
}
