import 'package:la_vie_web/data/model/common_models/general_data.dart';

class ToolData extends GeneralData{
  String? toolId;

  ToolData({this.toolId, name, description, imageUrl}) : super(toolId, name, description, imageUrl);

  ToolData.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    toolId = json['toolId'];
  }
}