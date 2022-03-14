class VerifyPhone {
  VerifyPhone({
    required this.phoneNumber,
    required this.code,
  });
  late final String phoneNumber;
  late final String code;

  VerifyPhone.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phoneNumber'] = phoneNumber;
    _data['code'] = code;
    return _data;
  }
}
