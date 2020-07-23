// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_parsing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['email_verified'] as String,
    json['active'] as bool,
    json['restaurant'] == null
        ? null
        : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'email_verified': instance.email_verified,
      'active': instance.active,
      'restaurant': instance.restaurant,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    json['id'],
    json['user_id'],
    json['name'],
    json['description'],
    json['image'],
    json['website'],
    json['pre_order'],
    json['longitude'],
    json['latitude'],
    json['open_time'],
    json['close_time'],
    json['est_delivery_time'],
    (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : Reviews.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'website': instance.website,
      'pre_order': instance.pre_order,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'open_time': instance.open_time,
      'close_time': instance.close_time,
      'est_delivery_time': instance.est_delivery_time,
      'reviews': instance.reviews,
    };

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return Reviews(
    json['id'],
    json['customer_id'],
    json['order_id'],
    json['restaurant_id'],
    json['rating'],
    json['review'],
  );
}

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customer_id,
      'order_id': instance.order_id,
      'restaurant_id': instance.restaurant_id,
      'rating': instance.rating,
      'review': instance.review,
    };
