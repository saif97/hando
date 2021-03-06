import 'package:flutter/material.dart';

import 'home.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Publish Your Products!",
          // style: TextStyle(color: Colors.black26),
        ),
        centerTitle: true,
      ),
      body: _Main(),
    );
  }
}

class _Main extends StatefulWidget {
  const _Main({Key key}) : super(key: key);

  @override
  __MainState createState() => __MainState();
}

class __MainState extends State<_Main> {
  TextEditingController itemCategory = new TextEditingController();
  TextEditingController itemName = new TextEditingController();
  TextEditingController itemDescription = new TextEditingController();
  TextEditingController itemPrice = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Fill the fields with information"),
              Text("for the Item you want to put on sell!"),
              Text("Your item will be inspected after."),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: itemCategory,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Category",
                      hintText: "Category",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      controller: itemName,
                      decoration: InputDecoration(
                        labelText: "Item's Name",
                        hintText: "Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      controller: itemDescription,
                      decoration: InputDecoration(
                        labelText: "Item's Description",
                        hintText: "Description",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      controller: itemPrice,
                      decoration: InputDecoration(
                        labelText: "Price",
                        hintText: "Price",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Upload Images"),
                Icon(Icons.upload_rounded),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Please recheck the information before submitting"),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Submit Item"),
                  Icon(Icons.done),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
