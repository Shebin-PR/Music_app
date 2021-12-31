import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/playing/openassetaudio.dart';
import 'package:my_app/playing/play.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class Favourites extends StatelessWidget {
  Favourites({
    Key? key,
  }) : super(key: key);

  List<Audio> music = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffE4E5E6),
                Color(0xff00416A),
                Color(0xff928DAB),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: ListView(
              physics: BouncingScrollPhysics(),
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
                                      offset: Offset(0, -10),
                                      color: Colors.black)
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
                                favourites[ind].artist ?? "No artist",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }

  BoxDecoration shadowFunction() {
    return BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
