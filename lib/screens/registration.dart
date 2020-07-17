import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF739b21),
        accentColor: Color(0xFFc4d5a1),
      ),
      home: Scaffold(
        body: RegistrationUI(),
      ),
    );
  }
}

class RegistrationUI extends StatefulWidget {
  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
          child: ListView(
        children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50)),
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.supervised_user_circle,
                          color: Color(0xFF739b21),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white24)),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Color(0xFF739b21))),
                        keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFF739b21),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white24)),
                        hintText: "Mobile",
                        hintStyle: TextStyle(color: Color(0xFF739b21))),
                        keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(

                        prefixText: "Address",
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Color(0xFF739b21),
                          textDirection: TextDirection.ltr,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white24)),
                        
                        hintStyle: TextStyle(color: Color(0xFF739b21))),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Color(0xFF739b21),
                    onPressed: (){},
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                                          child: Text("Sign Up",style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Color(0xFF739b21))
                    ),
                  ),
                ),
                                
              ],
            ),
        ],
      ),
    );
  }
}
