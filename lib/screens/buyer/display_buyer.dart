import 'dart:convert';

import 'package:bazaar/models/product.dart';

import 'package:bazaar/models/utils.dart';
import 'package:bazaar/screens/registration.dart';
import 'package:bazaar/screens/seller/add_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplayBuyer extends StatelessWidget {
  String cat_id;
  DisplayBuyer(this.cat_id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF739b21),
        accentColor: Color(0xFFc4d5a1),
      ),
      home: DisplayUI(cat_id),
    );
  }
}

class DisplayUI extends StatefulWidget {
  String cat_id;
  DisplayUI(this.cat_id);

  @override
  _DisplayUIState createState() => _DisplayUIState(cat_id);
}

class _DisplayUIState extends State<DisplayUI> {
  String cat_id;
  _DisplayUIState(this.cat_id);

  Future<List<Product>> _getProducts() async {
    var response = await http.post(Utils.URL + "getProduct.php");
    var jsondata = json.decode(response.body);
    List<Product> products = [];
    for (var u in jsondata) {
      Product product = Product(
        u['prod_id'],
        u['quantity'],
        u['price'],
        u['location'],
        u['breed'],
      );
      products.add(product);
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: FutureBuilder(
            future: _getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xFF739b21),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10, right: 5),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/rice.png"),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(snapshot.data[index].breed +
                                          " |" +
                                          " Rice" +
                                          " in " +
                                          snapshot.data[index].location),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF739b21),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 3)),
                                            Text(snapshot.data[index].price)
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.assessment,
                                              color: Color(0xFF739b21),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 3)),
                                            Text(snapshot.data[index].quantity)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: RaisedButton(
                                    color: Color(0xFF739b21),
                                    onPressed: () {},
                                    child: Text(
                                      "Bid",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Color(0xFF739b21))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
              /*return Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0xFF739b21),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        bottom: 10,
                                        right: 5),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/rice.png"),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(snapshot.data[index].breed +
                                          " |" +
                                          " Rice" +
                                          " in " +
                                          snapshot.data[index].location),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF739b21),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 3)),
                                            Text(snapshot.data[index].price)
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.assessment,
                                              color: Color(0xFF739b21),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 3)),
                                            Text(snapshot.data[index].quantity)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: RaisedButton(
                                    color: Color(0xFF739b21),
                                    onPressed: () {},
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        "Bid",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Color(0xFF739b21))),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              );*/
            }));
  }
}
