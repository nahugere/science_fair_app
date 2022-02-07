import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TDview extends StatefulWidget {
  const TDview({
    Key key,
  }) : super(key: key);

  @override
  _TDviewState createState() => _TDviewState();
}

class _TDviewState extends State<TDview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(color: Platform.isIOS ? CupertinoTheme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,)
            // child: ModelViewer(
            //   backgroundColor: Colors.white.withOpacity(0.0),
            //   src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
            //   alt: "A 3D model of an astronaut",
            //   ar: true,
            //   autoRotate: true,
            //   cameraControls: true,
            // ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.42,
            color: Colors.green[900],
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Text("Heart"),
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              children: [
                Expanded(child: CupertinoButton.filled(pressedOpacity: 0.9, child: Text("More Information"), onPressed: ()=>print("hh"))),
                IconButton(icon: Icon(Icons.share), onPressed: ()=>print("hh")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}