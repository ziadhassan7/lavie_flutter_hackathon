import 'package:la_vie_web/data/model/common_models/plant_data.dart';

class BlogModel {

  String? type;
  String? message;
  PlantData? data;

  BlogModel({this.type, this.message, this.data});

  BlogModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? PlantData.fromJson(json['data']) : null;
  }
}