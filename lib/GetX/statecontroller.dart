import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/database/datamodel.dart';
import 'package:my_app/database/local.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateController extends GetxController {
  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }

  final OnAudioQuery audioQuery = OnAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  List<SongModel> songs = [];
  List<AllSongs> Datasongs = [];
  List<AllSongs>? db = [];
  Box<List<AllSongs>> box = Boxes.getSongsDb();
  List<Audio> allaudios = [];
  requestPermission() async {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();
      Box fav = Hive.box('playlist');
      List favourites = [];
      await fav.put("favourites", favourites);
    }

    songs = await audioQuery.querySongs();
    Datasongs = songs
        .map((e) => AllSongs(
              path: e.uri!,
              id: e.id,
              title: e.title,
              duration: e.duration,
              artist: e.artist,
            ))
        .toList();

    await box.put("music", Datasongs);
    db = box.get('music');
    db!.forEach((element) async {
      if (!await File(element.path).exists()) {
        return;
      }

      allaudios.add(Audio.file(element.path,
          metas: Metas(
              title: element.title,
              id: element.id.toString(),
              artist: element.artist)));
    });
    update();
  }

  bool isSwitched = true;

  getSwitchValues() async {
    isSwitched = await getSwitchState();
    update();
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("toggleSwitch", value);
    return prefs.setBool("toggleSwitch", value);
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSwitched = await prefs.getBool("toggleSwitch");

    return isSwitched != null ? isSwitched : true;
  }
}

class SongControllerbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StateController());
  }
}
