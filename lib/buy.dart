import 'package:flutter/material.dart';

class Buy extends StatefulWidget {
  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {

  TextEditingController search = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.grey[300],
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: search,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Search for Keywords",
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.search)
                  ],
                ),
                SizedBox(
                  height: 40,
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
                SizedBox(
                  height: 10,
                ),
                Text("Can't find an Item ? Try using broad keywords")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
