import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Widgets/bottommodel.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import '../libraries/library.dart';

// ignore: must_be_immutable
class PlayScreen extends StatelessWidget {
  List<Audio> songs;
  final List<SongModel> audio;
  PlayScreen({
    Key? key,
    required this.songs,
    this.audio = const [],
  }) : super(key: key);

  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  var duration;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey[200],
            body: assetsAudioPlayer.builderCurrent(
                builder: (context, Playing? playing) {
              final myAudios = find(songs, playing!.audio.assetAudioPath);
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff000428),
                      Color(0xff004e92),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: imageshadowss(),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Library(
                                              audios: [],
                                            )),
                                  );
                                  print("Library pressed");
                                },
                                icon: const Icon(
                                  Icons.library_music_rounded,
                                  color: Colors.lightBlueAccent,
                                )),
                          ),
                          Container(
                              decoration: imageshadowss(),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    print("back pressed");
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.lightBlueAccent,
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
                      SizedBox(height: 50),

                      /////////////title////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          myAudios.metas.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.blueGrey[500],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),

                      /////////////////////////////artist/////////////////////////////////////////////////////////////////////////////
                      Text(
                        myAudios.metas.artist ?? "No Artist",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 30),

                      ////////////////seek bar//////////////////////////////////////////////////////////////////////////////////////
                      assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, RealtimePlayingInfos? info) {
                        if (info == null) {
                          return SizedBox();
                        }
                        return Container(
                          height: 10,
                          width: 315,
                          child: ProgressBar(
                            progress: info.currentPosition,
                            total: info.duration,
                            onSeek: (to) {
                              assetsAudioPlayer.seek(to);
                            },
                            thumbColor: Colors.blue[800],
                            baseBarColor: Colors.lightBlueAccent,
                            thumbGlowColor: Colors.blueGrey,
                            progressBarColor: Colors.lightBlue[900],
                          ),
                        );
                      }),

                      ////////////////////controls//////////////////////////////////////////////////////////////
                      SizedBox(height: 60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: imageshadowss(),
                            child: IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.previous();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Colors.lightBlueAccent,
                                )),
                          ),
                          PlayerBuilder.isPlaying(
                              player: assetsAudioPlayer,
                              builder: (context, isplaying) {
                                return Container(
                                  height: 80,
                                  width: 80,
                                  decoration: imageshadowss(),
                                  child: IconButton(
                                      onPressed: () async {
                                        await assetsAudioPlayer.playOrPause();
                                      },
                                      icon: Icon(
                                        isplaying
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        size: 32,
                                        color: Colors.lightBlueAccent,
                                      )),
                                );
                              }),
                          Container(
                            decoration: imageshadowss(),
                            child: IconButton(
                              onPressed: () {
                                assetsAudioPlayer.next();
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      /////////////////playlist- favourites//////////////////////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: imageshadowss(),
                            child: IconButton(
                                onPressed: () {
                                  if (audio.isNotEmpty) {
                                    var ply = audio.firstWhere((element) =>
                                        element.id.toString() ==
                                        myAudios.metas.id.toString());

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            BottomPopUp(audio: ply));
                                  }
                                },
                                icon: const Icon(
                                  Icons.playlist_add_sharp,
                                  color: Colors.lightBlueAccent,
                                )),
                          ),

                          //////////////////////
                          ///
                          SizedBox(
                            width: 100,
                          ),
                          ////////////////////////
                          ///
                          Container(
                            height: 55,
                            width: 55,
                            decoration: imageshadowss(),
                            child: IconButton(
                                onPressed: () {
                                  if (audio.isNotEmpty) {
                                    var ply = audio.firstWhere((element) =>
                                        element.id.toString() ==
                                        myAudios.metas.id.toString());

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            BottomPopUp(audio: ply));
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.lightBlueAccent,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })));
  }

  // BoxDecoration progressDecoration() {
  //   return BoxDecoration(
  //     color: Colors.black,
  //     borderRadius: BorderRadius.circular(10),
  //     boxShadow: [
  //       BoxShadow(
  //         blurRadius: 1,
  //         offset: Offset(-5, -5),
  //         color: Colors.transparent,
  //       ),
  //       BoxShadow(
  //         blurRadius: 5,
  //         offset: Offset(17.5, 17.5),
  //         color: Colors.blueGrey,
  //         // color: Color.fromRGBO(214, 223, 230, 1),
  //       )
  //     ],
  //   );
  // }

  BoxDecoration imageshadowss() {
    return BoxDecoration(
        color: Colors.lightBlueAccent[500],
        // color: Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.lightBlueAccent));
  }
}
