import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/homescreen.dart';

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
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 650,
              width: 500,
              child: Lottie.network(
                  "https://assets1.lottiefiles.com/datafiles/ovL488ma5whkm8k/data.json"),
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
