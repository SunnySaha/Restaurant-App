import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurent_app/models/menu_list.dart';
import 'package:restaurent_app/models/GetMenuList.dart';
import 'package:restaurent_app/resources/CallAPi.dart';


class GetMenuListRepo{



  Future<List<GetMenuListModel>> getmenulistfromModel(var response)async{

   //List<GetMenuListModel> req = MenuList.fromJson(json.decode(response.body)).toList();


  }

}