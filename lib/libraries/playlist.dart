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

  // List<Audio> playAudio = [];
  // List<Audio> audio = [];
  bool isUserPressed = false;
  @override
  Widget build(BuildContext context) {
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
                builder: (BuildContext context, Box play, _) {
                  List y = play.get(widget.title);
                  // y.forEach((element) {
                  //   playAudio.add(Audio.file(element.path,
                  //       metas: Metas(
                  //           title: element.title,
                  //           id: element.id.toString(),
                  //           artist: element.artist)));
                  // });
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: y.length,
                      itemBuilder: (ctx, ind) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
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
                            child: ListTile(
                              onTap: () {
                                // OpenAssetAudio()
                                //     .openAsset(index: ind, audios: playAudio);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => PlayScreen(
                                //             songs: playAudio,
                                //           )),
                                // );
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
                              leading: QueryArtworkWidget(
                                id: y[ind].id,
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
                        );
                      },);
                },
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => abc(name: widget.title));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    ));
  }
}

class abc extends StatefulWidget {
  abc({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _abcState createState() => _abcState();
}

class _abcState extends State<abc> {
  @override
  Widget build(BuildContext context) {
    Box<List<AllSongs>> box = Boxes.getSongsDb();
    Box playlist = Hive.box('playlist');
    var k = box.get("music");
    var y = playlist.get(widget.name);

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
            itemCount: k!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  k[index].title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                leading: QueryArtworkWidget(
                  id: k[index].id!,
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
                        .where((element) => element.id == k[index].id)
                        .isEmpty
                    ? IconButton(
                        onPressed: () {
                          y.add(k[index]);

                          playlist.put(widget.name, y);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.black,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          y.removeWhere(
                            (element) =>
                                element.id.toString() == k[index].id.toString(),
                          );
                          playlist.put(widget.name, y);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.minimize_outlined,
                          color: Colors.black,
                        ),
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}