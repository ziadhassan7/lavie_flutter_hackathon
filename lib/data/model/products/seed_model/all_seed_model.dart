import '../../common_models/seed_data.dart';

class AllSeedModel {
  String? type;
  String? message;
  List<SeedData>? allData;

  AllSeedModel(
      {this.type,
        this.message,
        this.allData});


  AllSeedModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];

    if (json['data'] != null) {
      allData = <SeedData>[];
      json['data'].forEach((v) {
        allData!.add(SeedData.fromJson(v));
      });
    }
  }

}

