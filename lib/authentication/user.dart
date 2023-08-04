// Change it with your own user data model

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? profileUrl;
  String? token;
  String? refreshToken;

  User(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.profileUrl,
      this.token,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileUrl = json['profile_url'];
    token = json['token'];
    refreshToken= json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_url'] = profileUrl;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
