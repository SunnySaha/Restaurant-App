import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurent_app/RouteTransition/routeAnimation.dart';
import 'package:restaurent_app/UI/RegistrationPages/RegistrationThird.dart';
import 'package:restaurent_app/UI/RegistrationPages/regi.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'package:restaurent_app/UI/Register.dart';
import 'package:restaurent_app/main.dart';

class RegistrationSecondPage extends StatefulWidget {
  List list;
  RegistrationSecondPage({this.list});

  @override
  _RegistrationSecondPageState createState() => _RegistrationSecondPageState(list:list);
}

class _RegistrationSecondPageState extends State<RegistrationSecondPage> {

  List list;
  bool isSwitched = true;
  String preOrder="1";
  _RegistrationSecondPageState({this.list});
  TextEditingController addressController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController websiteController = new TextEditingController();
  TextEditingController preOrderController = new TextEditingController();

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
                'Few thing\'s to Go..',
                style: Theme.of(context).textTheme.display3.merge(TextStyle(color: Color(0xFFccccdd), fontSize: 25.0)),
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
                    keyboardType: TextInputType.text,
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: Dhaka',
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.add_location, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: "Short Description",
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ex: One of the best..',
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.add_comment, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: websiteController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Website",
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'www.example.com',
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.web, color: Theme.of(context).accentColor),
                      //suffixIcon: Icon(Icons.remove_red_eye, color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Do you take any Pre Order?", style: TextStyle(color: Color(0xFFdc0024)),),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor:
                        Color(0xFFdc0024),
                        activeColor: Color(0xFFccccdd),
                      ),
                    ],

                  ),

//                  TextField(
//                    controller: preOrderController,
//                    keyboardType: TextInputType.number,
//                    obscureText: false,
//                    decoration: InputDecoration(
//                      labelText: "Pre Order",
//                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
//                      contentPadding: EdgeInsets.all(12),
//                      hintText: 'Ex: 1 or more',
//                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
//                      prefixIcon: Icon(Icons.reorder, color: Theme.of(context).accentColor),
//                      //suffixIcon: Icon(Icons.remove_red_eye, color: Theme.of(context).focusColor),
//                      border: OutlineInputBorder(
//                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
//                      focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
//                      enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
//                    ),
//                  ),


                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new RawMaterialButton(
                        onPressed: () {
                          Navigator.push(context, SlideRightRoute(page: Register()));
                        },
                        child: new Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 5.0,
                        fillColor: Color(0xFFdc0024),
                        padding: const EdgeInsets.all(15.0),
                      ),

                      new RawMaterialButton(
                        onPressed: () {


                          checkCredential();
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
                  SizedBox(height: 25),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/MobileVerification');
                    },
                    padding: EdgeInsets.symmetric(vertical: 14),
                    color: Theme.of(context).accentColor.withOpacity(0.1),
                    shape: StadiumBorder(),
                    child: Text(
                      'Register with Google',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
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
              textColor: Theme.of(context).hintColor,
              child: Text('I have account? Back to login'),
            ),
          )
        ],
      ),
    );
  }

  void checkCredential() {


    if(addressController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Please enter address",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xFF8C98A8),
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      if(descriptionController.text.isEmpty){
        Fluttertoast.showToast(
            msg: "Enter a short description",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xFF8C98A8),
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
        if(websiteController.text.isEmpty){
          Fluttertoast.showToast(
              msg: "Enter your business website",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color(0xFF8C98A8),
              textColor: Colors.white,
              fontSize: 16.0);
        }else{


            List list2 = new List();
            list2.add(list[0]);
            list2.add(list[1]);
            list2.add(list[2]);
            list2.add(list[3]);
            list2.add(addressController.text);
            list2.add(descriptionController.text);
            list2.add(websiteController.text);
            if(isSwitched){
              preOrder = "1";
            }else{
              preOrder = "0";
            }
            list2.add(preOrder);
            print(list[3]);
            print(list2[7]);
            Navigator.push(context, SlideLeftRoute(page: RegistrationThirdPage(list2:list2)));

        }
      }
    }

  }
}
