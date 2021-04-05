import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Settings", style: TextStyle(color: Colors.black26),),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/logo.png", width: 100, height: 100,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" - Name of the User" , textAlign: TextAlign.start),
                      Text(" - Location of the User"),
                      Text(" - Phone Number of the User"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left : 8.0),
                    child: Card(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Icon(Icons.edit, color: Colors.grey[600],),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Container(color: Colors.black26),
            ),
            SizedBox(
              height: 50,
            ),
            Text("List of Items go here the User has"),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black12,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/logo.png", width: 125, height: 125,),
                  SizedBox(width: 5,),
                  Column(
                    children: [
                    Text("Name of the Item on Sell"),
                    Text("Price", textAlign: TextAlign.center,),
                  ],
                  ),
                  SizedBox(width: 25,),
                  Text("Statues"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black12,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/logo.png", width: 125, height: 125,),
                  SizedBox(width: 5,),
                  Column(
                    children: [
                      Text("Name of the Item on Sell"),
                      Text("Price", textAlign: TextAlign.center,),
                    ],
                  ),
                  SizedBox(width: 25,),
                  Text("Statues"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
