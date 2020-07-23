import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class CallApi{

  final String _urladmin = 'https://admin.hiro.work';
  final String _urluser = 'https://jeatapi.azurewebsites.net/oAuth/';
  // //final String _urladmin = 'http://10.0.2.2:8000';
  //final String _urluser = 'http://192.168.0.100:8000';
  Future<void> postData(data, apiUrl) async {
    var fullUrl = _urluser + apiUrl;
    //  print(await _setHeaders());
    print("full url is : $fullUrl");
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: await _setHeaders()
    );

  }



  loginPostData(data, apiUrl) async {
    var fullUrl = _urluser + apiUrl;
    //  print(await _setHeaders());
    print("full url is : $apiUrl");
    return await http.post(
        apiUrl,
        body: jsonEncode(data),
        headers: await _setLoginHeaders()
    );

  }
  editData(data, apiUrl) async {
    var fullUrl = _urluser + apiUrl;
    //  print(await _setHeaders());
    return await http.put(
        fullUrl,
        body: jsonEncode(data),
        headers: await _setHeaders()
    );

  }


  getData(apiUrl) async {
    //var fullUrl = _urluser + apiUrl;
    print(apiUrl);
    return await http.get(
        apiUrl,
        headers:  await _setHeaders()
    );
  }

  logIngetData(apiUrl) async {
    var fullUrl = _urluser + apiUrl;
    print(fullUrl);
    return await http.get(
        fullUrl,
        headers:  await _setLoginHeaders()
    );
  }


  _setHeaders() async => {
    "Authorization" : 'Bearer ' + await _getToken(),
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };


  _setLoginHeaders() async => {

    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };



  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(localStorage.getString('token'));
    return localStorage.getString('token');

  }
  adminUri(){
    return _urladmin;
  }

}