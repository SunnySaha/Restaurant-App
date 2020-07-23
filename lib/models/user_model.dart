import 'Review.dart';
import 'Menu.dart';

class User{

  String id;
  String email;
  String phone;
  String password;
  bool active;
  String emailVerified;
  String image;
  Restaurant restaurant;


  User({this.id, this.email, this.phone, this.password, this.active,
      this.image,this.emailVerified, this.restaurant});


//  User.fromJson(Map<String, dynamic> parsedJson){
//    id = parsedJson['id'];
//    email = parsedJson['email'];
//    password = parsedJson['password'];
//    phone = parsedJson['phone'];
//    active = parsedJson['active'];
//    emailVerified = parsedJson['emailVerified'];
//    image = parsedJson['image'];
//    restaurant = Restaurant.fromJson(parsedJson['restaurant']);
//
//  }
//
//  String get useremail => email;
//  int get userid => id;
//  String get userphone => phone;
//  String get useractive => active;
//  String get useremailverified => useremailverified;
//  String get userimage => image;


  factory User.fromJson(Map<String, dynamic> parsedJson){
    print('in users model');
    print(parsedJson);
    return User(
      id: parsedJson['id'].toString(),
      email: parsedJson['email'],
      phone: parsedJson['phone'],
      emailVerified: parsedJson['emailVerfied'],
      active: parsedJson['active'],
      image: parsedJson['image'],
      restaurant: Restaurant.fromJson(parsedJson['restaurant']),
    );
  }



}

class Restaurant{
  String id;
  String user_id;
  String name;
  String description;
  String address;
  String image;
  String website;
  bool pre_order;
  String open_time;
  String close_time;
  String ems_delivery;
  String off_days;
  String avg_rating;
  String total_review;
  bool has_menu;
  Review review;
  Menu menu;

  Restaurant({this.id, this.user_id, this.name, this.description, this.address,
      this.image, this.website, this.pre_order, this.open_time, this.close_time, this.ems_delivery,
  this.off_days, this.avg_rating, this.total_review, this.has_menu, this.review, this.menu});

  factory Restaurant.fromJson(Map<String, dynamic> parsedJson){
    print('in users model');
    print(parsedJson);
    return Restaurant(
      id: parsedJson['id'].toString(),
      user_id: parsedJson['user_id'].toString(),
      name: parsedJson['name'],
      description: parsedJson['description'],
      address: parsedJson['address'],
      image: parsedJson['image']
    );
  }

}