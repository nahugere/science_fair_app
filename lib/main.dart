import 'dart:io';
import 'dart:ui';
// import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/services.dart';
import 'package:science_fair_project_app/pages/pages.dart';
import 'package:science_fair_project_app/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:science_fair_project_app/example1.dart';
import 'package:model_viewer/model_viewer.dart';

import 'main_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MainStateWidget(
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        // theme:ThemeData.dark(),
        home: Scaffold(body: MyHomePage()),
      ),
    );
  }
}
