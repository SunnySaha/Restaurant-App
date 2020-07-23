/*
class LoginModel{
  String _email;
  String _password;

  LoginModel(this._email, this._password);

  LoginModel.fromJson(Map<String, dynamic> parsedJson){
    _email = parsedJson['email'];
    _password = parsedJson['password'];
  }

  String get email => _email;
  String get password => _password;
}


class MenuCategory{
  String name;
  int restaurant_id;
  String update_at;
  String create_at;
  int id;

  MenuCategory(this.name, this.restaurant_id, this.update_at, this.create_at);

  MenuCategory.fromJson(Map<String, dynamic> parsedmenuJson){
    name = parsedmenuJson['name'];
    restaurant_id = parsedmenuJson['restaurant_id'];
    update_at = parsedmenuJson['updated_at'];
    create_at = parsedmenuJson['created_at'];
    id = parsedmenuJson['id'];
  }

  Map<String, dynamic> toJson()=>{

    'name':name,
    'restaurant_id': restaurant_id,
    'updated_at': update_at,
    'create_at': create_at,


  };

  String get getname => name;
  int get getrestaurantid => restaurant_id;
  String get getupdated => update_at;
  String get getcreated => create_at;
  int get getid => id;


}

class UserModel{

  int id;
  String email;
  String phone;
  String email_verified;

}


class Menu{
  int id;
  int restaurant_id;
  bool active;
  String name;

}

class Item{
  int id;
  int restaurant;

}*/
