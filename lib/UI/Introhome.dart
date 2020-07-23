import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurent_app/main.dart';

import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:restaurent_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurent_app/resources/CallAPi.dart';
import 'package:restaurent_app/models/json_parsing.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'package:restaurent_app/models/Menu.dart';
import 'Menu/menu_list.dart';


class IntroHome extends StatefulWidget {
  @override
  _IntroHomeState createState() => _IntroHomeState();
}

class _IntroHomeState extends State<IntroHome> {

  TextEditingController addmenuController = new TextEditingController();
  Color mainColor = Color(0xFFdc0024);
  var size = 20.0;
  var textSize = 17.0;
  var submenuText = 15.0;
  var submenuIcon = Icons.check_circle_outline;
  Color textColor = Color(0xFF344968);
  var active;
  var email;
  var phone;
  var id;

  getInformation() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    String data = localstorage.getString('user');
    var token = localstorage.getString('token');
    var userData = json.decode(data);

    setState(() {
      email = userData['email'];
      active = userData['active'];
      phone = userData['phone'];
      id = userData['restaurant']['id'];

      print(userData);
    });

    print(token);
  }

//  Future<void>getProfile() async{
//
//    var response = await CallApi().getData("https://jeatapi.azurewebsites.net/api/restaurant/profile");
//    print(response);
//    var body = json.decode(response.body);
//
//    print("Profile $body");
//
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getInformation();
    //getProfile();
  }

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Activity $active"),
            Text("email $email"),
            Text("phone $phone"),
            Text('restaurant id $id'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//      Container(
//        color: mainColor,
//        height: MediaQuery.of(context).size.height / 3.5,
//        child: UserAccountsDrawerHeader(
//
//          accountName: Text(
//            "User Name",
//            style: TextStyle(fontSize: 22.0, color: Colors.white),
//          ),
//          accountEmail: Text("spicekitchen@gmail.com",
//              style: TextStyle(fontSize: 18.0, color: Colors.white)),
//          currentAccountPicture: CircleAvatar(
//            backgroundColor:
//            Theme.of(context).platform == TargetPlatform.android
//                ? mainColor
//                : Colors.white,
//            child: Text(
//              "U",
//              style: TextStyle(fontSize: 40.0),
//            ),
//          ),
//        ),
//      ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return Profile();
//              }));
              },
              leading: Icon(Icons.home, color: mainColor, size: size),
              title: Text("Home",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return Profile();
//              }));
              },
              leading: Icon(Icons.notifications, color: mainColor, size: size),
              title: Text("Notifications",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return Profile();
//              }));
              },
              leading:
                  Icon(Icons.bookmark_border, color: mainColor, size: size),
              title: Text("My Orders",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ExpansionTile(
                  leading: Icon(
                    Icons.add_box,
                    color: mainColor,
                    size: size,
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    color: mainColor,
                    size: size,
                  ),
                  title: Text(
                    "Menu",
                    style: (TextStyle(fontSize: textSize, color: textColor)),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                ShowModalBottomSheet(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    submenuIcon,
                                    size: size,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "Add Menu",
                                    style: (TextStyle(
                                        fontSize: submenuText,
                                        color: textColor)),
                                  ),
                                ],
                              )),
                          Divider(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MenuList();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    submenuIcon,
                                    size: size,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "MenuList",
                                    style: (TextStyle(
                                        fontSize: submenuText,
                                        color: textColor)),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                    leading: Icon(
                      Icons.add,
                      color: mainColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: mainColor,
                      size: size,
                    ),
                    title: Text(
                      "Item",
                      style: (TextStyle(fontSize: textSize, color: textColor)),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      submenuIcon,
                                      size: size,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "Add Item",
                                      style: (TextStyle(
                                          fontSize: submenuText,
                                          color: textColor)),
                                    ),
                                  ],
                                )),
                            Divider(),
                            GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      submenuIcon,
                                      size: size,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "ItemList",
                                      style: (TextStyle(
                                          fontSize: submenuText,
                                          color: textColor)),
                                    ),
                                  ],
                                )),
                            Divider(),
                            GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      submenuIcon,
                                      size: size,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "Item OptionList",
                                      style: (TextStyle(
                                          fontSize: submenuText,
                                          color: textColor)),
                                    ),
                                  ],
                                )),
                            Divider(),
                            GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      submenuIcon,
                                      size: size,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "Nutrition List",
                                      style: (TextStyle(
                                          fontSize: submenuText,
                                          color: textColor)),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ExpansionTile(
                  leading: Icon(
                    Icons.add,
                    color: mainColor,
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    color: mainColor,
                    size: size,
                  ),
                  title: Text(
                    "Offer",
                    style: (TextStyle(fontSize: textSize, color: textColor)),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    submenuIcon,
                                    size: size,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "Add Offer",
                                    style: (TextStyle(
                                        fontSize: submenuText,
                                        color: textColor)),
                                  ),
                                ],
                              )),
                          Divider(),
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    submenuIcon,
                                    size: size,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "OfferList",
                                    style: (TextStyle(
                                        fontSize: submenuText,
                                        color: textColor)),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
              leading: Icon(Icons.notifications, color: mainColor, size: size),
              title: Text("Profile",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return Profile();
//              }));
              },
              leading: Icon(Icons.settings, color: mainColor, size: size),
              title: Text("Settings",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//                return Profile();
//              }));
              },
              leading: Icon(Icons.lock, color: mainColor, size: size),
              title: Text("Logout",
                  style: TextStyle(fontSize: textSize, color: textColor)),
            ),
          ],
        ),
      ),
    );
  }

  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: MediaQuery.of(context).size.height/2,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
               Text("Add Menu..", style: TextStyle(fontSize: 25.0, color: mainColor),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: addmenuController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of Menu'),
                  ),
                ),

                RaisedButton(
                  textColor: Colors.white,
                  color: mainColor,
                  child: Text("Add"),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),


              ],
            ),
          );
        }
    );
  }


}
