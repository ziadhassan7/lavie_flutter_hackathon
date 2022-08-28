import 'package:la_vie_web/data/model/forum/data/forum_data.dart';

class AllForumsModel {
  String? type;
  String? message;
  List<ForumData>? data;

  AllForumsModel({this.type, this.message, this.data});

  AllForumsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ForumData>[];
      json['data'].forEach((v) {
        data!.add(ForumData.fromJson(v));
      });
    }
  }

}