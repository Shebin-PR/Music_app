import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/database/datamodel.dart';
import 'package:my_app/database/local.dart';
import 'package:my_app/playing/notification.dart';
import 'package:my_app/playing/play.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
  List y = [];
  List<Audio> playAudio = [];
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
              ValueListenableBuilder(
                valueListenable: Hive.box('playlist').listenable(),
                builder: (BuildContext context, Box play, Widget? _) {
                  y = play.get(widget.title);
                  y.forEach((element) {
                    playAudio.add(Audio.file(element.path,
                        metas: Metas(
                            title: element.title,
                            id: element.id.toString(),
                            artist: element.artist)));
                  });

                  print(y);
                  return Container(
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: y.length,
                        itemBuilder: (ctx, ind) {
                          return ListTile(
                            onTap: () {
                              OpenAssetAudio()
                                  .openAsset(index: ind, audios: playAudio);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayScreen(
                                          songs: playAudio,
                                        )),
                              );
                            },
                            title: Text(
                              y[ind].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
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
                          );
                        }),
                  );
                },
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
          print("play float");
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    ));
  }

  showBottomSheet() {
    List b = [];
    songfetching() async {
      Box<List<AllSongs>> box = Boxes.getSongsDb();
      b = box.get('music')!;
      print(b);
      print('kkda');
    }

    Box playlist = Hive.box('playlist');
    List songp = [];
    showModalBottomSheet(
        context: context,
        builder: (ctx1) {
          songfetching();
          return Container(
            width: double.infinity,
            height: 300,
            color: Colors.white,
            child: ListView(
              children: [
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: b.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          b[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        leading: QueryArtworkWidget(
                          id: b[index].id,
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
                        trailing: y
                                .where((element) => element.id == b[index].id)
                                .isEmpty
                            ? IconButton(
                                onPressed: () {
                                  songp.add(b[index]);

                                  playlistbox.put(widget.title, songp);
                                },
                                icon: Icon(
                                  y
                                          .where((element) =>
                                              element.id == b[index].id)
                                          .isEmpty
                                      ? Icons.add_box
                                      : Icons.minimize_outlined,
                                  color: Colors.black,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  songp.removeWhere((element) =>
                                      element.id == b[index].id.toString());
                                  playlistbox.put(widget.title, songp);
                                },
                                icon: Icon(
                                  y
                                          .where((element) =>
                                              element.id == b[index].id)
                                          .isEmpty
                                      ? Icons.add_box
                                      : Icons.minimize_outlined,
                                  color: Colors.black,
                                ),
                              ),
                      );
                    })
              ],
            ),
          );
        });
  }
}
