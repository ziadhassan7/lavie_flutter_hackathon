import 'package:la_vie_web/data/model/common_models/general_data.dart';

class PlantData extends GeneralData{
  String? plantId;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  PlantData(
      {this.plantId,
        name,
        description,
        imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature}) : super(plantId, name, description, imageUrl);

  PlantData.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    plantId = json['plantId'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}