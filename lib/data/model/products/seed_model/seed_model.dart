import '../../common_models/seed_data.dart';

class SeedModel {
  String? type;
  String? message;
  SeedData? data;

  SeedModel(
      {this.type,
        this.message,
        this.data});


  SeedModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? SeedData.fromJson(json['data']) : null;
  }

}

