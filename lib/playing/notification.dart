import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenAssetAudio {
  List<Audio> allaudios;
  int index;
  bool? isSwitched;

  Future<bool?> setSwitchedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitched = await prefs.getBool("toggleSwitch");
    return isSwitched;
  }

  OpenAssetAudio({required this.allaudios, required this.index});

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  open() async {
    isSwitched = await setSwitchedValue();
    audioPlayer.open(
      Playlist(audios: allaudios, startIndex: index),
      showNotification: isSwitched == null || isSwitched == true ? true : false,
      autoStart: true,
    );
  }
}
