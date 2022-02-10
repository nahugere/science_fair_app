import 'dart:io';
import 'dart:ui';
// import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:science_fair_project_app/pages/pages.dart';
import 'package:science_fair_project_app/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int TdView = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BG holder Image
        
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1616225372747-5b3894991eee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // HelloWorld(),        

        TopShadow(),

        AnimatedOpacity(
          opacity: TdView==1 ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: Container(
            color: Platform.isIOS ? CupertinoTheme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
            child: SafeArea(
              child: TdView==1 ? TDview() : Container(),
            ),
          ),
        ),

        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(top: 20, right: 15),
          height: 100,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (b) {
                return SearchPage();
              }));
            },
            child: Icon(CupertinoIcons.search),
          ),
        ),

        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          height: 100,
          child: CupertinoSlidingSegmentedControl<int>(
            padding: EdgeInsets.all(3.5),
            groupValue: TdView,
            children: {
              0: buildSegment("AR view"),
              1: buildSegment("3D view"),
            },
            onValueChanged: (value){
              setState(() {
                TdView = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildSegment(String text){
    return Container(
      // height: 30,
      // make border radius 20  
      child: Text(text,style: TextStyle(fontSize: 18, color: Colors.white),),
    );
  }

}