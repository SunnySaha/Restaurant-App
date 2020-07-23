import 'package:flutter/material.dart';
import 'package:restaurent_app/UI/profile.dart';
import 'package:restaurent_app/config/app_config.dart';
import 'package:restaurent_app/UI/Item/addItem.dart';
import 'Introhome.dart';
import 'Menu/menu_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addmenuController = new TextEditingController();
  int _selectedIndex = 0;
  Color mainColor = Color(0xFFdc0024);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);
  var size = 20.0;
  var textSize = 17.0;
  var submenuText = 15.0;
  var submenuIcon = Icons.remove_circle_outline;
  Color textColor = Color(0xFF344968);
  var active;
  var email;
  var phone;
  var id;

  static List<Widget> _widgetOptions = <Widget>[
    IntroHome(),
    Text(
      ' Orders',
    ),
    Text(
      'Add Items',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Home"),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Menu'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFdc0024),
        onTap: _onItemTapped,
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
                      padding: EdgeInsets.only(left: 25.0),
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
                        padding: EdgeInsets.only(left: 25.0),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return AddItem();
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
                      padding: EdgeInsets.only(left: 25.0),
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

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(

        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height/1.5,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Add Menu..",
                  style: TextStyle(fontSize: 25.0, color: _secondColor),
                ),
                Padding(
                  padding:EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom, left: 10.0, right: 10.0, top: 10.0),
                  child: TextField(
                    controller: addmenuController,
                    obscureText: false,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of Menu'),
                  ),
                ),
                RaisedButton(
                  textColor: textColor,
                  color: _secondColor,
                  child: Text(
                    "Add",
                    style: TextStyle(color: _secondDarkColor),
                  ),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
