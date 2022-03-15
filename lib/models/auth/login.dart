class LoginData {
  LoginData({
    required this.phoneNumber,
    required this.password,
  });
  String? phoneNumber;
  String? password;

  LoginData.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    return _data;
  }
}
