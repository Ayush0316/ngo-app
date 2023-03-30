import 'package:tflite_flutter/tflite_flutter.dart';

List<String> Tags = [
  "Art & Culture",
  "Children ",
  "EnvironmenT & Forests",
  "Health",
  "Family Welfare",
  "Legal Awareness & Aid",
  "Vocational Training ",
  "Women's development & Empowerment",
  "Youth affairs",
  "Agriculture",
  "Teaching",
  "Human Rights",
  "Panchayti Raj",
  "Urban Development & Poverty Alleviation",
  "Women's Development & Empowerment",
  "Civic Issues",
  "Differently abled",
  "tourism",
  "sports",
  "aged/elderly",
  "Nutrition",
  "hiv/aids",
  "minority issues",
  "science & technoloy",
  "water resources",
  "Information & commnication technology",
  "skill development",
  "micro finance",
  "rural development",
  "food processing",
  "dairying & fisheries",
  "animal husbandry",
  "tribal affairs",
  "drinking water",
  "micro small & medium enterprises",
  "labours & employement",
  "industrial reseach",
  "new & renewable energy",
  "advocacy",
  "prisoner's issues",
  "housing",
  "land resources",
  "disaster management",
  "biotechnology",
  "monuments conservation",
  "student counselling",
  "Clean city",
  "Peace",
  "Dalit upliftment",
  "any other"
];

Future preProcessing(String st_tag) async {
  List<double> init = List.filled(50, 0.0);
  int index = Tags.indexOf(st_tag);
  print(index);
  init[index] = 1.0;
  return init;
}

Interpreter? _interpreter;

Future _loadModel(String name) async {
  final _name = name;
  _interpreter = await Interpreter.fromAsset(_name);
  print('Interpreter loaded successfully');
}

Future<double> ml(String st_tag) async {
  await _loadModel("model2_again.tflite");
  dynamic input = await preProcessing(st_tag);
  var output = List.filled(1, 0).reshape([1, 1]);
  _interpreter!.run(input, output);
  return output[0][0];
}
