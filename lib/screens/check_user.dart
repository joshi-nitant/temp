import 'package:flutter/material.dart';

import 'package:bazaar/screens/buyer/dashboard_buyer.dart';
import 'package:bazaar/screens/seller/dashboard.dart';

class CheckUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckUserUI(),
    );
  }
}

class CheckUserUI extends StatefulWidget {
  @override
  _CheckUserUIState createState() => _CheckUserUIState();
}

class _CheckUserUIState extends State<CheckUserUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                alignment: FractionalOffset.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Who are you ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Color(0xFF739b21),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/rs.png",
                                height: 150,
                                width: 150,
                              ),
                              Text(
                                "Seller",
                                style: TextStyle(
                                    color: Color(0xFF739b21), fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardBuyer()));
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/rice.png",
                                height: 150,
                                width: 150,
                              ),
                              Text(
                                "Buyer",
                                style: TextStyle(
                                    color: Color(0xFF739b21), fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    spacing: 20,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        "Bazaar",
                        style:
                            TextStyle(color: Color(0xFF739b21), fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
