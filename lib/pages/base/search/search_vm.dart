import 'package:flutter/material.dart';

import '../../../data/models/disease_model.dart';

class SearchViewModel extends ChangeNotifier {
  final List<PlantDiseaseModel> _plantDisease = [
    PlantDiseaseModel(name: "Fungus", imageUrl: "assets/images/fungi.png"),
    PlantDiseaseModel(
        name: "Abiotic", imageUrl: "assets/images/fungicides.png"),
    PlantDiseaseModel(
        name: "Black Sort", imageUrl: "assets/images/blackSpot.png"),
    PlantDiseaseModel(name: "Blight", imageUrl: "assets/images/blight.png"),
    PlantDiseaseModel(
        name: "Downy Mildew", imageUrl: "assets/images/downymildew.png"),
    PlantDiseaseModel(
        name: "Powdery Mildew", imageUrl: "assets/images/powderyMildew.png"),
    PlantDiseaseModel(name: "Fungus", imageUrl: "assets/images/fungi.png"),
    PlantDiseaseModel(name: "Fungus", imageUrl: "assets/images/fungi.png"),
    PlantDiseaseModel(name: "Canker", imageUrl: "assets/images/canker.png"),
  ];

  List<PlantDiseaseModel> _filteredData = [];

  List<PlantDiseaseModel> get filteredData => _filteredData;

  SearchViewModel() {
    _filteredData = _plantDisease;
  }

  void filterData(String query) {
  _filteredData = _plantDisease
      .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
      .toList();
  notifyListeners();
}

}
