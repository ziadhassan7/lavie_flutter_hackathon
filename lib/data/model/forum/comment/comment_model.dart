import '../data/nested/comment_data.dart';

class CommentModel {
  String? type;
  String? message;
  CommentData? data;

  CommentModel({this.type, this.message, this.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? CommentData.fromJson(json['data']) : null;
  }
}
