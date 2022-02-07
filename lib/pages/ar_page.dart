import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArCoreView(
          type: ArCoreViewType.STANDARDVIEW,
          debug: true,
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
        Positioned(
          bottom: 10,
          left: 50,
          child: TextButton(child: Text("hello"), onPressed: ()=>_addCylindre(arCoreController),)
        )
      ],
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    // arCoreController.;

    // _addSphere(arCoreController);
    // _addCylindre(arCoreController);
    // _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final node = ArCoreReferenceNode(
      objectUrl: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
      position: vector.Vector3(0.0, -0.5, -1.0)
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}