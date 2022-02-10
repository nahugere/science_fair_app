import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:science_fair_project_app/constants.dart';

import '../main_state.dart';

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
    final model = MainState.of(context).obModel;
    return Container(
      padding: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: model==null ? Center(
        child: Text("No model to view", style: Theme.of(context).textTheme.headline6,),
      ) : Column(
        children: [
          Expanded(
            // child: Container(color: Platform.isIOS ? CupertinoTheme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,)
            child: ModelViewer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              src: "https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb",
              alt: "A 3D model of a/an ${model.name}",
              ar: false,
              autoRotate: true,
              cameraControls: true,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.22,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              children: [
                Text(model.name, style: Theme.of(context).textTheme.headline6),
                Padding(padding: EdgeInsets.only(top:8)),
                Text(model.description, style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
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