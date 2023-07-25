
// Change it with your own user data model

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? profileUrl;

  User(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.profileUrl,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_url'] = profileUrl;
    return data;
  }
}
