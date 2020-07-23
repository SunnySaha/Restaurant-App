import 'package:json_annotation/json_annotation.dart';
part 'Menu.g.dart';

@JsonSerializable()
class Menu{

  String id;
  String restaurant_id;
  bool active;
  String name;

  List<Items> item;

  Menu(this.id, this.restaurant_id, this.active, this.name, this.item);

  factory Menu.fromJson(Map<String, dynamic>json)=>_$MenuFromJson(json);
}

@JsonSerializable()
class Items{
  String id;
  String restaurant_id;
  String menu_id;
  String name;
  String image;
  String unit;
  bool active;
  String unit_price;

  Items(this.id, this.restaurant_id, this.menu_id, this.name, this.image, this.unit, this.active, this.unit_price);

  factory Items.fromJson(Map<String, dynamic>json)=>_$ItemsFromJson(json);
}