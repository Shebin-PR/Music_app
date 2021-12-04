import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/playing/notification.dart';
import 'package:my_app/playing/play.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Favourites extends StatefulWidget {
  const Favourites({
    Key? key,
  }) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Audio> music = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            //    physics: BouncingScrollPhysics(),
            //  scrollDirection: Axis.vertical,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Favourites",
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
                      decoration: shadowFunction(),
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
              ),
              SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: Hive.box('playlist').listenable(),
                builder: (context, Box fav, _) {
                  List favourites = fav.get("favourites");
                  favourites.forEach((element) {
                    music.add(Audio.file(element.path,
                        metas: Metas(
                            title: element.title,
                            id: element.id.toString(),
                            artist: element.artist)));
                  });
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: favourites.length,
                    itemBuilder: (ctx, ind) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          decoration: shadowFunction(),
                          child: ListTile(
                            onTap: () {
                              OpenAssetAudio()
                                  .openAsset(index: ind, audios: music);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayScreen(
                                          songs: music,
                                        )),
                              );
                            },
                            title: Text(
                              favourites[ind].title!,
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
                              id: favourites[ind].id!,
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
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }

  BoxDecoration shadowFunction() {
    return BoxDecoration(
        // color: Colors.grey[200],
        color: Color(0XFFEFF3F6),
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
}


   