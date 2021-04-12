import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hando/infrastructure/firebase.dart';
import 'package:hando/view_models/locator.dart';

class ScreenListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing')),
      body: _Main(),
    );
  }
}

class _Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFacade firebaseApi = locator();

    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firebaseApi.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
            print(snapshot.data);
            return Text("Loading");
          }
          return ListView(
              children: snapshot.data.docs
                  .map((DocumentSnapshot doc) => ProductCard(
                        productName: doc.data()['name'],
                        listImageUrls: List<String>.from(doc.data()['imageURLs']),
                      ))
                  .toList());
        },
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
    print(listImageUrls[0]);
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: listImageUrls[0],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(productName),
          ],
        ),
      ),
    );
  }
}
