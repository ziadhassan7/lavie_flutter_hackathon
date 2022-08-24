import '../../common_models/plant_data.dart';

class PlantModel {
  String? type;
  String? message;
  PlantData? data;

  PlantModel(
      {this.type,
        this.message,
        this.data});


  PlantModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? PlantData.fromJson(json['data']) : null;
  }

}

