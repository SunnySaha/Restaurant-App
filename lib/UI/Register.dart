import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'RegistrationPages/regi.dart';
import 'package:restaurent_app/RouteTransition/routeAnimation.dart';
import 'package:restaurent_app/main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  File _image;

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;
  var time=  "XX-XX-XX";
  Future<Null> selectTime(BuildContext context) async{
    picked =  await showTimePicker(context: context, initialTime: _time);

    if(picked != null && picked!= _time){
      setState(() {
        _time = picked;
        //time = "${TimeOfDay.fromDateTime("H:m:s").format(_time)}";
        //var currentTime = TimeOfDay.fromDateTime(DateTime.parse('2018-10-20 16:30:04Z'));

      });
    }
  }
  
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create an Account", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Container(
        padding:
        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
        color: Colors.white,
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ////////////  upload image //////////////


                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Address',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.add_location,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ///description ui start ///
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Short Description',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.add_comment,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  ///description ui end ///
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),


                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      obscureText: true,
                    ),
                  ),

                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Website',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.web,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Pre Order 1 or more',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.reorder,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),


                  Container(
                    margin:
                    EdgeInsets.only(left: 7, right: 7, bottom: 15,top: 15),
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
                          onTap: (){ selectTime(context); },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.all(Radius.circular(1)),
                                border: Border.all(color: Theme.of(context).primaryColor,)
                            ),
                            child: Text(_time.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),


                  Container(
                    margin:
                    EdgeInsets.only(left: 7, right: 7, bottom: 15, top: 5),
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
                          onTap: (){ selectTime(context); },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.all(Radius.circular(1)),
                                border: Border.all(color: Theme.of(context).primaryColor,)
                            ),
                            child: Text(_time.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 7, right: 7, bottom: 15,top: 5),
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
                          onTap: (){ selectTime(context); },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.all(Radius.circular(1)),
                                border: Border.all(color: Theme.of(context).primaryColor,)
                            ),
                            child: Text(_time.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),


                  ///image picker start ///
                  Container(
                    // margin: EdgeInsets.only(,
                    child: _image == null
                        ? Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //   alignment: Alignment.center,
                          margin:
                          EdgeInsets.only(top: 20, left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: DottedBorder(
                            color: Colors.redAccent,
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

                  ///image picker end ///
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 50),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, SlideLeftRoute(page: MyApp()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Theme.of(context).primaryColor,
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(top: 19.0, bottom: 10.0),
                  //   child: Text(
                  //     'Forgot Password?',
                  //     style: TextStyle(
                  //       color: Theme.of(context).accentColor,
                  //       fontSize: 12.0,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account? ',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, SlideLeftRoute(page: Register()));
                          },
                          child: Text(
                            'Sign In ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
