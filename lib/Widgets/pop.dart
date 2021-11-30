

import 'package:flutter/material.dart';

class PopingUp extends StatefulWidget {
  const PopingUp({Key? key}) : super(key: key);

  @override
  _PopingUpState createState() => _PopingUpState();
}

class _PopingUpState extends State<PopingUp> {
  @override
  Widget build(BuildContext context) {
    return showBottomSheet();
  }

  showBottomSheet()  {
    showModalBottomSheet(
        context: context,
        builder: (ctx1) {
          return Container(
            width: double.infinity,
            height: 300,
            color: Colors.black,
            child: ListView(
              children: [
                Text("Hello world"),
              ],
            ),
          );
        });
  }
}


// Future<void> showBottomSheet(BuildContext ctx) {
//       
//           });