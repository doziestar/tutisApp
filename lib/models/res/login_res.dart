class LoginResponse {
  LoginResponse({
    required this.data,
    required this.message,
    required this.token,
    required this.expiresIn,
  });
  late final Data data;
  late final String message;
  late final String token;
  late final int expiresIn;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    message = json['message'];
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['token'] = token;
    _data['expiresIn'] = expiresIn;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.phoneNumber,
  });
  late final String id;
  late final String email;
  late final String phoneNumber;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}
