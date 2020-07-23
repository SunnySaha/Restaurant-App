import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurent_app/Models/models.dart';
import 'package:restaurent_app/UI/RegistrationPages/regi.dart';
import 'package:restaurent_app/resources/CallAPi.dart';
import 'package:restaurent_app/src/BlockButtonWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'UI/Home.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:http/http.dart' as http;
import 'UI/Register.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  static const int _blackPrimaryValue = 0xFFdc0024;
//  static const MaterialColor primaryColor = MaterialColor(
//    _blackPrimaryValue,
//    <int, Color>{
//      50: Color(0xFFdc0024),
//      100: Color(0xFFdc0024),
//      200: Color(0xFFdc0024),
//      300: Color(0xFFdc0024),
//      400: Color(0xFFdc0024),
//      500: Color(_blackPrimaryValue),
//      600: Color(0xFFdc0024),
//      700: Color(0xFFdc0024),
//      800: Color(0xFFdc0024),
//      900: Color(0xFFdc0024),
//    },
//  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurent Management',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Restaurent App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController forgetpasscontroller = new TextEditingController();

//  Future<LoginModel> GetLogedIn() async {
//    print("entered");
//    final response = await http
//        .get("https://jeatapi.azurewebsites.net/oAuth/login/restaurant");
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      print("Response successfull");
//      // If the call to the server was successful, parse the JSON
////          SharedPreferences localstorage = await SharedPreferences.getInstance();
////      localstorage.setString("token", response.body["token"]);
////      localstorage.setString("userPass", password.text);
//    } else {
//      // If that call was not successful, throw an error.
//      throw Exception('Failed to load post');
//    }
//  }

//  static List<Widget> _widgetOptions = <Widget>[
//    HomePage(),
//    Text(
//      'Index 1: Business',
//    ),
//    Text(
//      'Index 2: School',
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(29.5),
              decoration: BoxDecoration(color: Color(0xFFdc0024)),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(29.5) - 120,
            child: Container(
              width: config.App(context).appWidth(84),
              height: config.App(context).appHeight(29.5),
              child: Text(
                'Let\'s Start with login!',
                style: Theme.of(context)
                    .textTheme
                    .display3
                    .merge(TextStyle(color: Color(0xFFccccdd), fontSize: 25.0)),
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(29.5) - 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                    )
                  ]),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
              width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: miralia@gmail.com',
                      hintStyle: TextStyle(
                          color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.alternate_email,
                          color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),

                      hintStyle: TextStyle(
                          color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.lock_outline,
                          color: Theme.of(context).accentColor),
                      //suffixIcon: Icon(Icons.remove_red_eye, color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 25),
                  BlockButtonWidget(
                    text: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    color: Color(0xFF344968),
                    onPressed: () {
                      checkLogin();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: FlatButton(
              onPressed: () {
                _forgetPassword();
              },
              textColor: Theme.of(context).hintColor,
              child: Text(
                'Forget Password?',
                style: TextStyle(color: Color(0xFFea5c44), fontSize: 16.0),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              textColor: Theme.of(context).hintColor,
              child: Text(
                'Don\'t have account? registration Here...',
                style: TextStyle(color: Color(0xFF344968), fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Future<void> checkLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      String getemail = email.text;
      String getpassword = password.text;
      print(getemail);
      print(getpassword);

      var jsonData = '{"email" : "$getemail", "password" : "$getpassword"}';
      print(jsonData);
//      var parsedJson = json.decode(jsonData);
//      var user = LoginModel.fromJson(parsedJson);
//      print('${user.email} is ${user.password}');

      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        "https://jeatapi.azurewebsites.net/oAuth/login/restaurant",
        headers: headers,
        body: jsonData,
      );
      print(response.body.toString());
      var body = json.decode(response.body);


      if (response.statusCode == 200) {
        print("Response successfull");
        SharedPreferences localstorage = await SharedPreferences.getInstance();
        localstorage.setString("token", body['token']);
        localstorage.setString("user", json.encode(body['restaurant']));

        Fluttertoast.showToast(
            msg: "You Are Successfully Loged in",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        // If the call to the server was successful, parse the JSON
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      } //else of error status code
    } else {
      Fluttertoast.showToast(
          msg: "Please Fill the Fields..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  _forgetPassword() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  'Reset Password..',
                  style: TextStyle(color: Colors.redAccent),
                ),
                content: SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFF2F2F2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: forgetpasscontroller,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Email Here..'),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new RawMaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: Colors.redAccent,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            //exit button end

                            //save button start
                            new RawMaterialButton(
                              onPressed: () {
                                executionForget();
                              },
                              child: new Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  void executionForget() {
    if (forgetpasscontroller.text.isNotEmpty) {
      print(forgetpasscontroller.text);
    }
    Navigator.pop(context);
    Fluttertoast.showToast(
        msg: "Update Soon!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showErrorDialog() {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.rotate(
            angle: math.radians(anim1.value * 360),
            child: Opacity(
              opacity: anim1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text('Hello!!'),
                content: Text('How are you?'),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300));
  }
}
