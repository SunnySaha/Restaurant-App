import 'package:json_annotation/json_annotation.dart';

part 'json_parsing.g.dart';

@JsonSerializable()
class User{

  String id;
  String email;
  String phone;
  String email_verified;
  bool active;
  Restaurant restaurant;

  User(this.id, this.email,this.phone,  this.email_verified, this.active, this.restaurant);

  factory User.fromJson(Map<String, dynamic> json)=>_$UserFromJson(json);

}

@JsonSerializable()
class Restaurant{
  dynamic id;
  dynamic user_id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic website;
  dynamic pre_order;
  dynamic longitude;
  dynamic latitude;
  dynamic open_time;
  dynamic close_time;
  dynamic est_delivery_time;

  List<Reviews> reviews;

  Restaurant(this.id, this.user_id, this.name, this.description, this.image, this.website, this.pre_order, this.longitude, this.latitude, this.open_time, this.close_time, this.est_delivery_time, this.reviews);
  factory Restaurant.fromJson(Map<String, dynamic> json)=>_$RestaurantFromJson(json);
}

@JsonSerializable()
class Reviews{
  dynamic id;
  dynamic customer_id;
  dynamic order_id;
  dynamic restaurant_id;
  dynamic rating;
  dynamic review;

  Reviews(this.id, this.customer_id, this.order_id, this.restaurant_id, this.rating, this.review);
  factory Reviews.fromJson(Map<String, dynamic> json)=>_$ReviewsFromJson(json);

}

