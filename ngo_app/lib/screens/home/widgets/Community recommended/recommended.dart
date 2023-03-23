import 'package:flutter/material.dart';
import 'package:ngo_app/services/ML/preprocessing.dart';

class Comu_recom extends StatefulWidget {
  const Comu_recom({super.key});

  @override
  State<Comu_recom> createState() => _Comu_recomState();
}

class _Comu_recomState extends State<Comu_recom> {
  // @override
  // void initState() {
  //   super.initState();
  //   loadModel();
  // }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   await Tflite.close();
  // }

  // runModel() async {
  //   var reco = Tflite.runModelOnFrame(bytesList: bytesList)
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Text("List of Communities Recommended to the User"),
    );
  }
}
