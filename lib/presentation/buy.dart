import 'package:cached_network_image/cached_network_image.dart';
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

class ProductCard extends StatelessWidget {
  final String productName;
  final List<String> listImageUrls;

  const ProductCard({Key key, this.productName, this.listImageUrls}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: listImageUrls[0],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(productName),
            ),
          ],
        ),
      ),
    );
  }
}