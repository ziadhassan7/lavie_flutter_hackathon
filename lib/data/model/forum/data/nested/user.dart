class PostUser {
  String? firstName;
  String? lastName;
  String? imageUrl;

  PostUser({this.firstName, this.lastName, this.imageUrl});

  PostUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }
}