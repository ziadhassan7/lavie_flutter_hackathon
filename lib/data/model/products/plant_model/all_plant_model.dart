import '../../common_models/plant_data.dart';

class AllPlantModel {
  String? type;
  String? message;
  List<PlantData>? allData;

  AllPlantModel(
      {this.type,
        this.message,
        this.allData});

  AllPlantModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];

    if (json['data'] != null) {
      allData = <PlantData>[];
      json['data'].forEach((v) {
        allData!.add(PlantData.fromJson(v));
      });
    }
  }

}

