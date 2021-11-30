import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:my_app/database/datamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenAssetAudio {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  // List<Audio> allaudios;
  // int index;
  bool? isSwitched;

  // OpenAssetAudio({required this.allaudios, required this.index});

  Future<bool?> setSwitchedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitched = await prefs.getBool("toggleSwitch");
    return isSwitched;
  }

  openAsset(
      // int ind, List<Audio> audio,
      {List<Audio>? audios,
      required int index}) async {
    isSwitched = await setSwitchedValue();
    audioPlayer.open(
      Playlist(audios: audios, startIndex: index),
      showNotification: isSwitched == null || isSwitched == true ? true : false,
      autoStart: true,
    );
  }

  AllSongs findSongFromDatabase(List<dynamic> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }
}
