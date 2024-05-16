// To parse this JSON data, do
//
//     final plantDiseaseModel = plantDiseaseModelFromJson(jsonString);

import 'dart:convert';

PlantDiseaseModel plantDiseaseModelFromJson(String str) => PlantDiseaseModel.fromJson(json.decode(str));

String plantDiseaseModelToJson(PlantDiseaseModel data) => json.encode(data.toJson());

class PlantDiseaseModel {
    String? name;
    String? imageUrl;

    PlantDiseaseModel({
        this.name,
        this.imageUrl,
    });

    factory PlantDiseaseModel.fromJson(Map<String, dynamic> json) => PlantDiseaseModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
    };
}
