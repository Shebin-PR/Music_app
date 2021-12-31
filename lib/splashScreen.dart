import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed("/home");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        // height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 650,
              // width: 500,
              child: Lottie.asset("assets/images/splashback.json"),
            ),
            Text(
              "Lullaby",
              style: TextStyle(color: Colors.grey, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
