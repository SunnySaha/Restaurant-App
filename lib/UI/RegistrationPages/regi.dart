import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurent_app/RouteTransition/routeAnimation.dart';
import 'package:restaurent_app/UI/Register.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'RegistrationNext.dart';
import 'package:restaurent_app/main.dart';
import 'package:restaurent_app/src/BlockButtonWidget.dart';
//import 'package:restaurant_rlutter_ui/src/elements/BlockButtonWidget.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

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
                'Let\'s Start with register!',
                style: Theme
                    .of(context)
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
                      color: Theme
                          .of(context)
                          .hintColor
                          .withOpacity(0.2),
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
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Restaurant Name",
                      labelStyle: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: Spicy',
                      hintStyle: TextStyle(color: Theme
                          .of(context)
                          .focusColor
                          .withOpacity(0.7)),
                      prefixIcon: Icon(Icons.person_outline, color: Theme
                          .of(context)
                          .accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: miralia@gmail.com',
                      hintStyle: TextStyle(color: Theme
                          .of(context)
                          .focusColor
                          .withOpacity(0.7)),
                      prefixIcon: Icon(Icons.alternate_email, color: Theme
                          .of(context)
                          .accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      contentPadding: EdgeInsets.all(12),

                      hintStyle: TextStyle(color: Theme
                          .of(context)
                          .focusColor
                          .withOpacity(0.7)),
                      prefixIcon: Icon(Icons.lock_outline, color: Theme
                          .of(context)
                          .accentColor),
                      //suffixIcon: Icon(Icons.remove_red_eye, color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                    ),
                  ),

                  SizedBox(height: 15,),

                  TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      labelStyle: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: +88xxxxxx',
                      hintStyle: TextStyle(color: Theme
                          .of(context)
                          .focusColor
                          .withOpacity(0.7)),
                      prefixIcon: Icon(Icons.phone_iphone, color: Theme
                          .of(context)
                          .accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .focusColor
                              .withOpacity(0.2))),
                    ),
                  ),


                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new RawMaterialButton(
                        onPressed: () {
                          checkCridential();
//                          Navigator.push(context, SlideLeftRoute(page: RegistrationSecondPage()));
                        },
                        child: new Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 22.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 5.0,
                        fillColor: Color(0xFFdc0024),
                        padding: const EdgeInsets.all(15.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/MobileVerification');
                    },
                    padding: EdgeInsets.symmetric(vertical: 14),
                    color: Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.1),
                    shape: StadiumBorder(),
                    child: Text(
                      'Register with Google',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,

            child: FlatButton(
              onPressed: () {
                Navigator.push(context, SlideLeftRoute(page: MyApp()));
              },
              textColor: Theme
                  .of(context)
                  .hintColor,
              child: Text('I have account? Back to login'),
            ),
          )
        ],
      ),
    );
  }

  void checkCridential() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter Your Name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xFF8C98A8),
          textColor: Colors.white,
          fontSize: 16.0);

    }else{
      if(emailController.text.isEmpty){
        Fluttertoast.showToast(
            msg: "Enter your email Address",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xFF8C98A8),
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
        if(passwordcontroller.text.isEmpty){
          Fluttertoast.showToast(
              msg: "Choose a password for your account",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color(0xFF8C98A8),
              textColor: Colors.white,
              fontSize: 16.0);
        }else{
          if(passwordcontroller.text.length<6 || passwordcontroller.text.length>12){
            Fluttertoast.showToast(
                msg: "Choose 6 to 12 character password",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 1,
                backgroundColor: Color(0xFF8C98A8),
                textColor: Colors.white,
                fontSize: 16.0);
          }else{
            if(phoneController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your business phone number",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Color(0xFF8C98A8),
                  textColor: Colors.white,
                  fontSize: 16.0);
            }else{
              List list = new List();
              list.add(nameController.text);
              list.add(emailController.text);
              list.add(passwordcontroller.text);
              list.add(phoneController.text);
              print(list[0]);

             Navigator.push(context, MaterialPageRoute(builder: (context){
               return RegistrationSecondPage(list: list);
             }));
            }
          }
        }
      }
    }
  }

}
