import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'homescreen.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'libraries/library.dart';

class PlayScreen extends StatefulWidget {
  SongModel songModel;
  PlayScreen({Key? key, required this.songModel}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.songModel.title);
    print(widget.songModel.artist);
  }

  var duration;
  @override
  Widget build(BuildContext context) {
    duration = widget.songModel.duration;
    return SafeArea(
        child: Scaffold(
            //  backgroundColor:  Color(0xFF99f2c8),
            // backgroundColor: Colors.yellow,
            body: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF99f2c8),
            Color(0xFFd9a7c7),
            Color(0xFFfffcdc),
          ],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
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
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 16.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
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
                        color: Colors.brown,
                      )),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
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
            SizedBox(height: 60),
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
                            id: widget.songModel.id,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                "assets/images/2.jpg",
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              alignment: Alignment.center,
              child: Text(
                widget.songModel.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 310,
              child: ProgressBar(
                progress: Duration(milliseconds: 101000),
                total: Duration(milliseconds: duration),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
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
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.green,
                      )),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
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
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow_sharp,
                        size: 40,
                        color: Colors.lightBlue,
                        // color: Color(0xFF88ECED),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
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
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                      blurRadius: 5.0,
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
    )));
  }
}
