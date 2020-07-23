// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    json['id'] as String,
    json['restaurant_id'] as String,
    json['active'] as bool,
    json['name'] as String,
    (json['item'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'restaurant_id': instance.restaurant_id,
      'active': instance.active,
      'name': instance.name,
      'item': instance.item,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    json['id'] as String,
    json['restaurant_id'] as String,
    json['menu_id'] as String,
    json['name'] as String,
    json['image'] as String,
    json['unit'] as String,
    json['active'] as bool,
    json['unit_price'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'restaurant_id': instance.restaurant_id,
      'menu_id': instance.menu_id,
      'name': instance.name,
      'image': instance.image,
      'unit': instance.unit,
      'active': instance.active,
      'unit_price': instance.unit_price,
    };
