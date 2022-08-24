import 'package:la_vie_web/data/model/common_models/plant_data.dart';
import 'package:la_vie_web/data/model/common_models/seed_data.dart';
import 'package:la_vie_web/data/model/common_models/tool_data.dart';

class BlogData {
  List<PlantData>? plants;
  List<SeedData>? seeds;
  List<ToolData>? tools;

  BlogData({this.plants, this.seeds, this.tools});

  BlogData.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <PlantData>[];
      json['plants'].forEach((v) {
        plants!.add(PlantData.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <SeedData>[];
      json['seeds'].forEach((v) {
        seeds!.add(SeedData.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <ToolData>[];
      json['tools'].forEach((v) {
        tools!.add(ToolData.fromJson(v));
      });
    }
  }
}