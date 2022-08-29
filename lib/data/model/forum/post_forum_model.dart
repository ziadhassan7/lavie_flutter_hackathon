class PostForum {
  String? title;
  String? description;
  String? imageBase64;

  PostForum({
    this.title,
    this.description,
    this.imageBase64,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['imageBase64'] = imageBase64;
    return data;
  }
}