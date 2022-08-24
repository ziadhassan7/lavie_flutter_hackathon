import 'data/blog_data.dart';

class AllBlogsModel {
  String? type;
  String? message;
  BlogData? data;

  AllBlogsModel({this.type, this.message, this.data});

  AllBlogsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? BlogData.fromJson(json['data']) : null;
  }
}