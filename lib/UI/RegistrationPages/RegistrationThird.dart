import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:restaurent_app/RouteTransition/routeAnimation.dart';
import 'package:restaurent_app/UI/RegistrationPages/RegistrationNext.dart';
import 'package:restaurent_app/UI/RegistrationPages/regi.dart';
import 'package:restaurent_app/config/app_config.dart' as config;
import 'package:restaurent_app/UI/Register.dart';
import 'package:restaurent_app/main.dart';
import 'package:restaurent_app/resources/CallAPi.dart';

class RegistrationThirdPage extends StatefulWidget {

  List list2;

  RegistrationThirdPage({this.list2});

  @override
  _RegistrationThirdPage createState() => _RegistrationThirdPage(list2:list2);
}

class _RegistrationThirdPage extends State<RegistrationThirdPage> {

  List list2;
  _RegistrationThirdPage({this.list2});
  File _image;

  var lat;
  var lan;
   var _time = TimeOfDay.now();

  String currentTime ;
  TimeOfDay roombooked;
  String opentimestring="select Open Time";
  String closetimestring="select close Time";
  String estimatedtimestring="select estimating Time";

  Future<Null> selectOpenTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(context: context, initialTime:_time );

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        opentimestring = _time.toString().substring(10,15);
        //String formatTimeOfDay(TimeOfDay _time, { bool alwaysUse24HourFormat = false });

      });
    }
  }

  Future<Null> selectCloseTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(context: context, initialTime:_time );

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        closetimestring = _time.toString().substring(10,15);
        //String formatTimeOfDay(TimeOfDay _time, { bool alwaysUse24HourFormat = false });

      });
    }
  }

  Future<Null> selectEstimatingTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(context: context, initialTime:_time );

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        estimatedtimestring = _time.toString().substring(10,15);
        //String formatTimeOfDay(TimeOfDay _time, { bool alwaysUse24HourFormat = false });

      });
    }
  }






  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  var location = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    location.onLocationChanged().listen((LocationData currentLocation) {
      setState(() {
        lat = currentLocation.latitude;
        lan = currentLocation.longitude;
      });


    });

  }

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
                'You are almost done!',
                style: Theme.of(context)
                    .textTheme
                    .display3
                    .merge(TextStyle(color: Color(0xFFccccdd), fontSize: 25.0, fontFamily: "Roboto")),
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
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Select Open Time',
                            style: TextStyle(
                                color: Color(0XFF09324B).withOpacity(0.6),
                                fontSize: 12,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectOpenTime(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1)),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Text(
                              opentimestring,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Select Close Time',
                            style: TextStyle(
                                color: Color(0XFF09324B).withOpacity(0.6),
                                fontSize: 12,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectCloseTime(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1)),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Text(
                              closetimestring,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0,),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Estimating Dalivery time',
                            style: TextStyle(
                                color: Color(0XFF09324B).withOpacity(0.6),
                                fontSize: 12,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectEstimatingTime(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1)),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Text(
                              estimatedtimestring,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0,),

                  Container(
                    // margin: EdgeInsets.only(,
                    child: _image == null
                        ? Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //   alignment: Alignment.center,
                          margin:
                          EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,

                          child: DottedBorder(
                            color: Color(0xFFdc0024),
                            radius: Radius.circular(60),
                            strokeWidth: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.file_upload,
                                            color: Color(0xFF8A8A8A)),
                                        onPressed: getImage),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only( bottom: 12),
                                    child: Text(
                                      'Upload Image',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: ClipOval(
                            child: Image.file(_image,
                                height: 120, width: 120, fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new RawMaterialButton(
                        onPressed: () {
                          registercridential();
//                          Navigator.push(
//                              context, SlideLeftRoute(page: MyApp()));
                        print(lat);
                        print(lan);
                        },
                        child: new Icon(
                          Icons.done_all,
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
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> registercridential() async {

    if(_time.toString()==null){
      Fluttertoast.showToast(
          msg: "Select Open Time",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xFF8C98A8),
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      if(_time.toString()==null){
        Fluttertoast.showToast(
            msg: "Select Closing Time",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Color(0xFF8C98A8),
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
        if(_time.toString()==null){
          Fluttertoast.showToast(
              msg: "Select Extimating time",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color(0xFF8C98A8),
              textColor: Colors.white,
              fontSize: 16.0);
        }else{


         String name = list2[0];
         String email = list2[1];
         String password = list2[2];
         String phone = list2[3];
         String address = list2[4];
         String description = list2[5];
         String website = list2[6];
         String preorder = list2[7];


         print(name);
         print(email);
         print(password);
         print(phone);
         print(address);
         print(description);
         print(website);
         print(preorder);
         print(opentimestring);
         print(closetimestring);
         print(estimatedtimestring);
         print(lat);
         print(lan);

         var jsonData = '{"name" : "$name", "email" : "$email", "password" : "$password", "phone": "$phone", "address": "$address", "description": "$description", "website": "$website", "latitude": "$lat", "longitude": "$lan", "image": "noimage.jpg", "pre_order": "$preorder", "open_time": "$opentimestring", "close_time": "$closetimestring", "est_delivery_time": "$estimatedtimestring", "off_days": "sun"}';

         print(jsonData);
         Map<String, String> headers = {"Content-type": "application/json"};
         final response = await http.post("https://jeatapi.azurewebsites.net/oAuth/register/restaurant",
           headers: headers,
           body: jsonData,
         );

          //var response = await CallApi().loginPostData(jsonData, 'https://jeatapi.azurewebsites.net/oAuth/register/restaurant');
          print(response);
          print(response.statusCode);
          var body = json.decode(response.body);
          print(body);


         if (response.statusCode == 200) {
           print("success");

           Fluttertoast.showToast(
               msg: "Your Registration is Successfully done!",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.CENTER,
               timeInSecForIos: 1,
               backgroundColor: Color(0xFF8C98A8),
               textColor: Colors.white,
               fontSize: 16.0);
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return MyApp();
           }));

         }
        }
      }
    }

  }
}
