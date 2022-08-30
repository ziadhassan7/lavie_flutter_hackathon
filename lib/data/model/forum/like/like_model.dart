import '../data/nested/like_data.dart';

class LikeModel {
  String? type;
  String? message;
  LikeData? data;

  LikeModel({this.type, this.message, this.data});

  LikeModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? LikeData.fromJson(json['data']) : null;
  }

}