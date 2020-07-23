import 'menu_list.dart';

class GetMenuListModel{

  String id;
  String restaurant_id;
  bool active;
  String name;

  GetMenuListModel({this.id, this.restaurant_id, this.active, this.name});

  GetMenuListModel.fromResponse(Menus response):
      id = response.id,
      restaurant_id = response.restaurant_id,
      active = response.active,
      name = response.name;

}