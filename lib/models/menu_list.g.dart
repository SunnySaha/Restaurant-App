// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuList _$MenuListFromJson(Map<String, dynamic> json) {
  return MenuList(
    (json['menus'] as List)
        ?.map(
            (e) => e == null ? null : Menus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'menus': instance.menus,
    };

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return Menus(
    json['id'] as String,
    json['restaurant_id'] as String,
    json['active'] as bool,
    json['name'] as String,
  );
}

Map<String, dynamic> _$MenusToJson(Menus instance) => <String, dynamic>{
      'id': instance.id,
      'restaurant_id': instance.restaurant_id,
      'active': instance.active,
      'name': instance.name,
    };
