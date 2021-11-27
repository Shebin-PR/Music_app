import 'package:flutter/material.dart';
import 'database/datamodel.dart';
import 'homescreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<List<AllSongs>>("songdata");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


// https://paglasongs.com/kithe-chaliye-tu-mp3-songs-madari.html 