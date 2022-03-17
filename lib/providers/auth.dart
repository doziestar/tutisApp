import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth/login.dart';
import '../models/auth/user_signup.dart';
import '../models/auth/verify_sms.dart';
import '../models/res/login_res.dart';
import '../models/res/signup_response.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  // Timer _authTimer;

  bool get isAuth {
    print('token: $_token');
    print('expiryDate: $_expiryDate');
    print('userId: $_userId');
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<UserSignupResponse> signUp(UserData user) async {
    var _url = Uri.parse('https://tutis.herokuapp.com/api/v1/auth/signup');
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
    final _url = Uri.parse('https://tutis.herokuapp.com/api/v1/auth/login');
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
    if (response.token != null) {
      _token = response.token;
      _userId = response.data.id;
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: response.expiresIn,
        ),
      );
      final _prefs = await SharedPreferences.getInstance();
      final _userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
        },
      );
      _prefs.setString('userData', _userData);

      _autoLogout();
      notifyListeners();
      return response;
    } else {
      throw Exception('Failed to login');
    }
    // notifyListeners();
  }

  Future<VerifyPhone> verifyPhone(VerifyPhone user) async {
    final _url =
        Uri.parse('https://tutis.herokuapp.com/api/v1/sms/verify-code');
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

  Future<bool> tryAutoLogin() async {
    final _prefs = await SharedPreferences.getInstance();
    if (!_prefs.containsKey('token')) {
      return false;
    }
    final _userData = json.decode(_prefs.getString('_userData') ?? '');

    _expiryDate = DateTime.parse(_userData('expiryDate'));
    if (_expiryDate!.isBefore(DateTime.now())) {
      return false;
    }
    _userId = _userData['userId'];
    _token = _userData['token'];
    _token = _token;
    _userId = _userId;
    _expiryDate = _expiryDate;
    notifyListeners();
    return true;
  }

  Future<bool> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
    // final _prefs = await SharedPreferences.getInstance();
    // _prefs.clear();
    return true;
  }

  void _autoLogout() {
    // var _authTimer = Timer(Duration(seconds: 10), logout);
    // if (_authTimer != null) {
    //   _authTimer.cancel();
    // }
    final _authTimer = Timer(
      Duration(
        seconds: _expiryDate!.difference(DateTime.now()).inSeconds,
      ),
      logout,
    );
  }
}
