class UserData {
  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    return _data;
  }
}
