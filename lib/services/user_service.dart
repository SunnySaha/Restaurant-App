import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base.dart';
import 'package:restaurent_app/models/user_model.dart';

class UserService extends ServiceBase{
  Future<User> getProfile()async
  {

  }

  _setHeaders() async => {
    "Authorization" : 'Bearer ' + await _getToken(),
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(localStorage.getString('token'));
    return localStorage.getString('token');

  }

}