import '../../common_models/tool_data.dart';

class AllToolModel {
  String? type;
  String? message;
  List<ToolData>? allData;

  AllToolModel(
      {this.type,
        this.message,
        this.allData});


  AllToolModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];

    if (json['data'] != null) {
      allData = <ToolData>[];
      json['data'].forEach((v) {
        allData!.add(ToolData.fromJson(v));
      });
    }
  }

}

