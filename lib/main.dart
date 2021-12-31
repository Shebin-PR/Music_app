import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/statecontroller.dart';
import 'package:my_app/database/playlistmodel.dart';
import 'package:my_app/homescreen.dart';
import 'package:my_app/splashScreen.dart';
import 'database/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<List<AllSongs>>("songdata");
  await Hive.openBox("playlist");
  Hive.registerAdapter(PlayListModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: "/splash",
          page: () => SplashScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: SongControllerbinding())
      ],
      initialRoute: "/splash",
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
    );
  }
}


// String hiveboxname = "songsfromdatabase";
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   if (!Hive.isAdapterRegistered(AllSongsAdapter().typeId)) {
//     Hive.registerAdapter(AllSongsAdapter());
//   }
//   await Hive.openBox<List<AllSongs>>(hiveboxname);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primaryColor: Colors.black),
//       home: SplashScreen(),
//     );
//   }
// }
