import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:restaurent_app/resources/CallAPi.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Color mainColor = Color(0xFFdc0024);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);

  var name;
  var description;
  var address;
  var website;

  var active;
  var email;
  var phone;
  var id;
  Future<void>getInformation() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    String data = localstorage.getString('user');
    var token = localstorage.getString('token');
    var userData = json.decode(data);

    setState(() {
      email = userData['email'];
      active = userData['active'];
      phone = userData['phone'];
      name = userData['restaurant']['id'];

      print(userData);

    });

    print(token);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getInformation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 23.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.mode_edit,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Just a design Not Implement yet",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Color(0xFF8C98A8),
                  textColor: Colors.white,
                  fontSize: 16.0);
//              Navigator.push(context, MaterialPageRoute(builder: (context){
//                //return ProfileEdit();
//              }));
            },
          ),

          IconButton(
            icon: Icon(
              Icons.vpn_key,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Just A design",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Color(0xFF8C98A8),
                  textColor: Colors.white,
                  fontSize: 16.0);
//              Navigator.push(context, MaterialPageRoute(builder: (context){
//                //return EditPassword();
//              }));
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  ///////////  profile name and picture start ///////////

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ///////////  profile  picture start ///////////
                        Container(
                          padding: EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,

                          ),
                          decoration: new BoxDecoration(
                            color: Colors.grey, // border color
                            shape: BoxShape.circle,
                          ),
                        ),

                        ///////////  profile picture end ///////////
                        SizedBox(
                          width: 10,
                        ),

                        ///////////  profile name start ///////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "${name}",
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(width: 2.0),
                                Text(
                                  "",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///////////  profile name end ///////////
                      ],
                    ),
                  ),

                  ///////////  profile name and picture end ///////////

                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 2,
                      child: Divider()),

                  // ///////////  Phone  ///////////

                  // profileInfo(
                  //     Icon(
                  //       Icons.phone,
                  //       color: Colors.grey,
                  //     ),
                  //     "Phone",
                  //     "01xxxxxxxxx"),

                  // Container(
                  //     margin: EdgeInsets.only(top: 0),
                  //     height: 2,
                  //     child: Divider()),

                  ///////////  Email ///////////

                  profileInfo(
                      Icon(
                        Icons.email,
                        size: 22.0,

                        color: Colors.blueGrey,
                      ),
                      "Email",
                      "email@email.com"),

                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),

                  ///////////  Address  ///////////

                  profileInfo(
                      Icon(
                        Icons.phone,
                        size: 22.0,
                        color: Colors.blueGrey,
                      ),
                      "Phone Number",
                      "XXXX-XX-X"),

                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),

                  ///////////  Country   ///////////




                ],
              )),
        ),
      ),
    );

  }

  Container profileInfo(Icon icon, String label, String data) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            icon,
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      label,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 8, top: 3),
                      child: Text(
                        data,
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ))
                ],
              ),
            ),
          ],
        ));
  }

}
