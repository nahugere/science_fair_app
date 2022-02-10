import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'services/model_service.dart';

class MainStateWidget extends StatefulWidget {
  final Widget child;
  MainStateWidget({ Key key, @required this.child }) : super(key: key);

  @override
  _MainStateWidgetState createState() => _MainStateWidgetState();
}

class _MainStateWidgetState extends State<MainStateWidget> {

  ModelService obModel;

  void changeModel(ModelService newModel) {
    setState(() {
      obModel = newModel;
    });
  }

  void removeModel() {
    setState(() {
      obModel = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainState(
      child: widget.child,
      object_model: obModel,
      mainStateWidget: this,
    );
  }
}

class MainState extends InheritedWidget {
  final ModelService object_model;
  final _MainStateWidgetState mainStateWidget;
  MainState({
    Key key,
    Widget child,
    @required this.object_model,
    @required this.mainStateWidget,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MainState oldWidget) => oldWidget.object_model != object_model;

  static _MainStateWidgetState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MainState>().mainStateWidget;

}