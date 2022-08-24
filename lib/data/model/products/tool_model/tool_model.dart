import '../../common_models/tool_data.dart';

class ToolModel {
  String? type;
  String? message;
  ToolData? data;

  ToolModel(
      {this.type,
        this.message,
        this.data});


  ToolModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? ToolData.fromJson(json['data']) : null;
  }

}

