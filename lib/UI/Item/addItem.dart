import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  Color mainColor = Color(0xFFdc0024);
  Color textColor = Color(0xFFccccdd);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);
  var textSize = 15.0;
  var headersize = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Add Item"),
        centerTitle: true,

      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[

            Container(
               width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Item Name',
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

            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(10.0),

                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      hintText: 'Item Unit',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0, fontStyle: FontStyle.italic),
                      prefixIcon: Icon(
                        Icons.line_weight,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(10.0),

                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      hintText: 'Item Name',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
