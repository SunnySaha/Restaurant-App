import 'package:flutter/material.dart';

import 'package:restaurent_app/main.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Menu> menu;
  List<Menu> displayMenu;
  TextEditingController searchTextController = new TextEditingController();
  TextEditingController updatemenunameController = new TextEditingController();
  Color mainColor = Color(0xFFdc0024);
  Color textColor = Color(0xFFccccdd);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);

  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  var datasrc;
  String searchchang;
  var textSize = 15.0;
  var headersize = 14.0;
  List filterList = new List();
  List filterData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    menu = Menu.getMenu();
    filterData = menu;
    datasrc = DTS(filterData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Menu List"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            elevation: 3.0,
            child: Column(
              children: <Widget>[
                PaginatedDataTable(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 35.0,
                        child: TextField(
                          onChanged: (value) {
                            searchItems(value);
                          },
                          controller: searchTextController,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: new Icon(Icons.search),
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add),
                            Text(" Menu"),
                          ],
                        ),
                        onPressed: () {
                          addmenu();
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                  columns: [
                    DataColumn(
                      label: Text("Id",
                          style: TextStyle(
                              color: _secondColor, fontSize: headersize)),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: _secondColor, fontSize: headersize),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                        label: Text("Actions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _secondColor,
                              fontSize: headersize,
                            )),
                        numeric: false)
                  ],

                  source: datasrc,
                  onRowsPerPageChanged: (t) {
                    setState(() {
                      _rowPerPage = t;
                    });
                  },
                  rowsPerPage: _rowPerPage,
//                            source: filterData.map(menuitem)=>DataRow(),
//                            rows:filterData
//                                .map(
//                                  (menuitem) => DataRow(
//                                    cells: [
//                                      DataCell(
//
//                                        Text(menuitem.id)
//                                      ),
//                                      DataCell(
//                                          Text(menuitem.name, style: TextStyle(color: _secondColor, fontSize: textSize),)
//                                      ),
//
//                                      DataCell(
//                                        Row(
//                                          children: <Widget>[
//                                            IconButton(
//
//                                              icon: Icon(Icons.remove_red_eye, color: Colors.blueGrey,),
//                                              onPressed: () {
//                                                print("View ${menuitem.id}");
//                                                //ShowModalBottomSheet(context, menuitem.name, 1);
//                                                viewMenu(menuitem.name);
//                                              },
//                                            ),
//
//                                            IconButton(
//                                              icon: Icon(Icons.edit, color: Colors.orange,),
//                                              onPressed: () {
//                                                print("Edited ${menuitem.id}");
//                                                showUpdateMenu(menuitem.id, menuitem.name);
//                                              },
//                                            ),
//
//                                            IconButton(
//                                              icon: Icon(Icons.delete_forever, color: mainColor,),
//                                              onPressed: () {
//                                                print("deleted ${menuitem.id}");
//                                              },
//                                            ),
//                                          ],
//                                        ),
//                                      )
//                                    ]
//                                  ),
//                                )
//                                .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowModalBottomSheet(BuildContext context, String name, int status) {
    String st = "Active";
    if (status == 0) {
      st = st;
    } else {
      st = "Deactive";
    }
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Menu name $name",
                  style: TextStyle(fontSize: 22.0, color: _secondColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Menu Status $st",
                  style: TextStyle(fontSize: 16.0, color: _secondColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  textColor: textColor,
                  color: _secondColor,
                  child: Text(
                    "Got it.",
                    style: TextStyle(color: _secondDarkColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showUpdateMenu(String id, String name) {
    setState(() {
      updatemenunameController.text = name;
    });
    showGeneralDialog(
        barrierColor: _secondColor.withOpacity(0.3),
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
                  'Menu Update for $id',
                  style: TextStyle(color: _secondColor),
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
                            controller: updatemenunameController,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'New Menu Name'),
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
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: mainColor,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            //exit button end

                            //save button start
                            new RawMaterialButton(
                              onPressed: () {},
                              child: new Icon(
                                Icons.done,
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: _secondColor,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
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

  void addmenu() {
    showGeneralDialog(
        barrierColor: _secondColor.withOpacity(0.3),
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
                  'Create Menu',
                  style: TextStyle(color: _secondColor),
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
                            controller: updatemenunameController,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Menu Name'),
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
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: mainColor,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            //exit button end

                            //save button start
                            new RawMaterialButton(
                              onPressed: () {},
                              child: new Icon(
                                Icons.done,
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: _secondColor,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
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

  void viewMenu(String name) {
    showGeneralDialog(
        barrierColor: _secondColor.withOpacity(0.3),
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
                  'Menu Details',
                  style: TextStyle(color: _secondColor),
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
                          child: Text("Name: $name"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //exit button end

                            //save button start
                            new RawMaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Icon(
                                Icons.done,
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: Colors.green,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
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

  void searchItems(String name) {
    if (searchTextController.text.isNotEmpty) {
      String search = searchTextController.text;
      menu = Menu.getMenu();

      //List displayMenu = new List();
      filterData = menu.where((menu) => menu.name.contains(name)).toList();

      setState(() {
        filterData = filterData;
      });
    } else {
      filterData = menu;
    }
  }
}

class DTS extends DataTableSource {
  Color mainColor = Color(0xFFdc0024);
  Color textColor = Color(0xFFccccdd);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);
  List<Menu> list;
  BuildContext context;
  DTS(this.list , this.context);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("${index + 1}")),
      DataCell(Text(this.list.elementAt(index).name.toString())),
      DataCell(
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                print("View ${this.list.elementAt(index).id.toString()}");
                //ShowModalBottomSheet(context, menuitem.name, 1);
                viewMenu(this.list.elementAt(index).name.toString());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.orange,
              ),
              onPressed: () {
                print("Edited ${this.list.elementAt(index).id.toString()}");
                //showUpdateMenu(menuitem.id, menuitem.name);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                print("deleted ${this.list.elementAt(index).id.toString()}");
              },
            ),
          ],
        ),
      )
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => list.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

  void viewMenu(String name) {
    showGeneralDialog(
        barrierColor: _secondColor.withOpacity(0.3),
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
                  'Menu Details',
                  style: TextStyle(color: _secondColor),
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
                          child: Text("Name: $name"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //exit button end

                            //save button start
                            new RawMaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Icon(
                                Icons.done,
                                color: _secondDarkColor,
                                size: 22.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 5.0,
                              fillColor: Colors.green,
                              padding: const EdgeInsets.all(15.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
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

}

class Menu {
  String id;
  String name;

  Menu({this.id, this.name});

  static List<Menu> getMenu() {
    return <Menu>[
      Menu(id: "1", name: "Desert"),
      Menu(id: "2", name: "Drinks"),
      Menu(id: "3", name: "Platter"),
      Menu(id: "4", name: "BreakFast"),
      Menu(id: "5", name: "Snacks"),
      Menu(id: "6", name: "Dinner"),
      Menu(id: "1", name: "Desert"),
      Menu(id: "2", name: "Drinks"),
      Menu(id: "3", name: "Platter"),
      Menu(id: "4", name: "BreakFast"),
      Menu(id: "5", name: "Snacks"),
      Menu(id: "6", name: "Dinner"),
    ];
  }
}
