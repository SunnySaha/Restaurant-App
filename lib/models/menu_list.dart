import 'package:json_annotation/json_annotation.dart';
part 'menu_list.g.dart';
@JsonSerializable()
class MenuList{

  List<Menus> menus;
  MenuList(this.menus);

  factory MenuList.fromJson(Map<String, dynamic>json)=>_$MenuListFromJson(json);
}

@JsonSerializable()
class Menus{

  String id;
  String restaurant_id;
  bool active;
  String name;

  Menus(this.id, this.restaurant_id, this.active, this.name);

  factory Menus.fromJson(Map<String, dynamic>json)=>_$MenusFromJson(json);
}