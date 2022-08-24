import 'package:la_vie_web/data/model/common_models/general_data.dart';

class SeedData extends GeneralData {
  String? seedId;

  SeedData({this.seedId, name, description, imageUrl}) : super(seedId, name, description, imageUrl);

  SeedData.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    seedId = json['seedId'];
  }

}