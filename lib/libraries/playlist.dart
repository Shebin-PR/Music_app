import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/Widgets/bottomsheet.dart';

class PlaylistSongs extends StatefulWidget {
  final List<dynamic> audios;
  final String title;
  PlaylistSongs({Key? key, required this.title, required this.audios})
      : super(key: key);

  @override
  _PlaylistSongsState createState() => _PlaylistSongsState();
}

class _PlaylistSongsState extends State<PlaylistSongs> {
  @override
  void initState() {
    super.initState();
  }

  AssetsAudioPlayer get assetsAudioPlayer => AssetsAudioPlayer.withId('0');
  List<Audio> audio = [];
  List<dynamic> a = [];
  dynamic playlistbox = Hive.box('playlist');
  bool isUserPressed = false;
  @override
  Widget build(BuildContext context) {
    a = playlistbox.get(widget.title);
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      // height: 50,
                      // width: 125,
                      alignment: Alignment.center,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                  offset: Offset(0, -10), color: Colors.black)
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
                  ),
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
              Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.grey,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Remove"),
                        value: 1,
                      ),
                    ],
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
            ],
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Box databox = Hive.box('songbox');
      //     List<dynamic> allsongsfromhive = databox.get('allsongs');
      //     print(allsongsfromhive[0]['id']);
      //     showModalBottomSheet<void>(
      //       context: context,
      //       builder: (context) {
      //         return bottomPop(name: widget.title);
      //       },
      //     );
      //     print("play float");
      //   },
      //   backgroundColor: Colors.black,
      //   child: const Icon(Icons.add),
      // ),
    )
    );
    
  }
}
