import 'dart:convert';
import 'dart:ffi';

import 'package:bazaar/models/utils.dart';
import 'package:bazaar/screens/registration.dart';
import 'package:bazaar/screens/seller/dashboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  String cat_id;
  AddProduct(this.cat_id);
  @override
  _AddProductState createState() => _AddProductState(cat_id);
}

class _AddProductState extends State<AddProduct> {
  bool c = false;
  var finalDate;
  String dd = "Select Date";
  String cat_id;
  _AddProductState(this.cat_id);

  TextEditingController breed = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController date = TextEditingController();

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finalDate = order;
      date.text = DateFormat('dd-MM-yyy').format(finalDate).toString();
    });
  }

  Future<DateTime> getDate() {
    return showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2019), 
        lastDate: DateTime(2222),
        builder: (BuildContext context,Widget child){
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        }
      );
  }

  Future _insertData() async {
    setState(() {
      c = true;
    });
    String strBreed = breed.text;
    String strPrice = price.text;
    String strQuantity = quantity.text;
    String strLocation = location.text;
    String strDate = date.text;

    var data = {
      "cat_id": cat_id,
      "breed": strBreed,
      "price": strPrice,
      "quantity": strQuantity,
      "location": strLocation,
      "date":strDate
    };
    var response = await http.post(Utils.URL + "insertData.php", body: data);
    var msg = jsonDecode(response.body);
    if (msg == "1") {
      setState(() {
        c = false;
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Error occured')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF739b21),
        accentColor: Color(0xFFc4d5a1),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bazaar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Akshit"),
                accountEmail: Text("akshitzatakia0@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/"),
                ),
              ),
              ListTile(
                title: Text("Register"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registration()));
                },
              ),
              ListTile(
                title: Text("About"),
                onTap: () {
                  //
                },
              ),
              ListTile(
                title: Text("Settings"),
                onTap: () {
                  //
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _heading(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color(0xFFc4d5a1),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: breed,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              hintText: "Breed",
                              hintStyle: TextStyle(color: Color(0xFF739b21))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: price,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              hintText: "Price",
                              hintStyle: TextStyle(color: Color(0xFF739b21))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: quantity,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              hintText: "Quantity",
                              hintStyle: TextStyle(color: Color(0xFF739b21))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: location,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              hintText: "Location",
                              hintStyle: TextStyle(color: Color(0xFF739b21))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onTap: callDatePicker,
                          controller: date,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              hintText: "Select Date",
                              hintStyle: TextStyle(color: Color(0xFF739b21))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Color(0xFF739b21),
                          onPressed: () {
                            _insertData();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Color(0xFF739b21))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _heading() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Add Product",
          style: TextStyle(
              color: Color(0xFF739b21),
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
