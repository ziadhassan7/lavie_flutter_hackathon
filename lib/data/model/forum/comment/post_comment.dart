class PostComment {
  String comment;

  PostComment({required this.comment});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    return data;
  }
}