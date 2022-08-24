class PostAuth {

  String? firstName;
  String? lastName;
  String email;
  String password;

  PostAuth(
      {this.firstName,
        this.lastName,
        required this.email,
        required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}