class NotificationModel {
  String? notificationId;
  String? userId;
  String? imageUrl;
  String? message;
  String? createdAt;

  NotificationModel({this.notificationId,
    this.userId,
    this.imageUrl,
    this.message,
    this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    userId = json['userId'];
    imageUrl = json['imageUrl'];
    message = json['message'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationId'] = notificationId;
    data['userId'] = userId;
    data['imageUrl'] = imageUrl;
    data['message'] = message;
    data['createdAt'] = createdAt;
    return data;
  }
}