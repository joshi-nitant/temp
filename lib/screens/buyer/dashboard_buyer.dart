import 'package:bazaar/models/category.dart';
import 'package:bazaar/models/utils.dart';
import 'package:bazaar/screens/buyer/display_buyer.dart';
import 'package:bazaar/screens/registration.dart';
import 'package:bazaar/screens/seller/display.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DashboardBuyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF739b21),
        accentColor: Color(0xFFc4d5a1),
      ),
      home: DashboardUI(),
    );
  }
}

class DashboardUI extends StatefulWidget {
  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {

  Future<List<Category>> _getCategory() async{
    var response =await  http.get(Utils.URL+"getData.php",);
    var jsonData = json.decode(response.body);
    List<Category> categories = [];
    for(var u in jsonData){
      Category category = Category(u['cat_id'], u['category_name'], u['category_image']);
      categories.add(category);
    }
    print(categories.length);
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bazaar",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          ),),
        
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
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>Registration()
                ));
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: (){
                //
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: (){
                //
              },
            ),
          ],
        ),
      ),
      
    body: FutureBuilder(
        future: _getCategory(),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.data == null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (snapshot.data.length/(snapshot.data.length+1))),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
            
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayBuyer(snapshot.data[index].cat_id)));
                },
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Container(
                    
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(Utils.URL+"images/"+snapshot.data[index].category_image,),
                      )
                    ),
                      
                    
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(8),
                                      child: Text(snapshot.data[index].category_name,style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF739b21),
                        fontWeight: FontWeight.bold
                        
                      ),),
                  ),
                  ],
                ),
              );
            },
            
            
          );
        },
          

    ),
          
   );
  }

  
}