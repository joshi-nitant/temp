
import 'package:bazaar/models/product.dart';
import 'package:bazaar/models/utils.dart';
import 'package:bazaar/screens/registration.dart';
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

  Future<List<Product>> _getProduct() async{
    var response =await  http.get(Utils.URL+"getProduct.php");
    var jsonData = json.decode(response.body);
    List<Product> products = [];
    for(var u in jsonData){
      Product product = Product(u['id'], u['name'], u['image'],u['description']);
      products.add(product);
    }
    print(products.length);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bazaar",style: TextStyle(
          color: Color(0xFF739b21),
          fontSize: 25,
          ),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF739b21)),
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
        future: _getProduct(),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.data == null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
            
              return ListTile(
                title: Text(snapshot.data[index].name),
                //leading:Image.network(Utils.URL+"images/"+snapshot.data[index].image),
                //subtitle: Text(snapshot.data[index].description),
                //isThreeLine: true,
              );
            },
            
            
          );
        },
          

    ),
          
   );
  }

  
}