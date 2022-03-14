import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/auth/login.dart';
import '../models/auth/user_signup.dart';
import '../models/auth/verify_sms.dart';
import '../models/res/login_res.dart';
import '../models/res/signup_response.dart';

class Auth with ChangeNotifier {
  Future<UserSignupResponse> signUp(UserData user) async {
    var _url = Uri.parse('http://10.0.2.2:3000/api/v1/auth/signup');
    final response = await http.post(
      _url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(UserData(
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        password: user.password,
      ).toJson()),
    );
    if (response.statusCode == 200) {
      return UserSignupResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<LoginResponse> login(LoginData user) async {
    print('object user');
    final _url = Uri.parse('http://127.0.0.1:3000/api/v1/auth/login');
    final _body = LoginData(
      phoneNumber: user.phoneNumber,
      password: user.password,
    ).toJson();
    final _headers = {
      'Content-Type': 'application/json',
    };
    print(_body);
    final _response =
        await http.post(_url, body: jsonEncode(_body), headers: _headers);
    print(_response.body);
    final LoginResponse response =
        LoginResponse.fromJson(json.decode(_response.body));
    notifyListeners();
    return response;
  }

  Future<VerifyPhone> verifyPhone(VerifyPhone user) async {
    final _url = Uri.parse('http://127.0.0.1:3000/api/v1/sms/verify-code');
    final _body = VerifyPhone(
      phoneNumber: user.phoneNumber,
      code: user.code,
    ).toJson();
    final _headers = {
      'Content-Type': 'application/json',
    };
    final _response =
        await http.post(_url, body: jsonEncode(_body), headers: _headers);
    print(_response.body);
    notifyListeners();
    return VerifyPhone.fromJson(json.decode(_response.body));
  }
}
