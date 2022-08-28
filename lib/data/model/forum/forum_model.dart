import 'package:la_vie_web/data/model/forum/data/forum_data.dart';

class ForumModel {
  String? type;
  String? message;
  ForumData? data;

  ForumModel({this.type, this.message, this.data});

  ForumModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? ForumData.fromJson(json['data']) : null;
  }

}