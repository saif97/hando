import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hando/infrastructure/firebase.dart';
import 'package:hando/view_models/locator.dart';

class ScreenListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Trending"),
              Tab(text: "Just For You"),
            ],
          ),
          title: Text('Trending'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: [
            _Main(index: 0),
            _Main(index: 1),
            _Main(index: 2),
          ],
        ),
      ),
    );
  }
}

class _Main extends StatefulWidget {
  final int index;

  const _Main({Key key, this.index}) : super(key: key);

  @override
  __MainState createState() => __MainState();
}

class __MainState extends State<_Main> {
  Widget out = Text("Loading");
  @override
  void initState() {
    FirebaseFacade firebaseApi = locator();
    if (widget.index == 0)
      out = _ListProducts();
    else {
      if (widget.index == 1)
        firebaseApi.getPopularProducts().then((v) => setState(() {
              out = _ListProducts(chosenIds: v);
            }));
      else {
        firebaseApi
            .getUserRecSysProducts('Dave')
            .then((v) => setState(() => out = _ListProducts(chosenIds: v)));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return out;
  }
}

class _ListProducts extends StatelessWidget {
  final List chosenIds;

  const _ListProducts({Key key, this.chosenIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFacade firebaseApi = locator();
    return StreamBuilder<QuerySnapshot>(
      stream: firebaseApi.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          print(snapshot.data);
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot doc) {
            if (chosenIds != null) {
              if (!chosenIds.contains(doc.id)) return Container();
            }
            return ProductCard(product: doc.data());
          }).toList(),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              height: 250,
              imageUrl: product['imageURLs'][0],
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(product['name']),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RatingBar.builder(
                    initialRating: product['review_avg'],
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    glow: true,
                    ignoreGestures: true,
                  ),
                  Container(width: 20),
                  Text(product['review_count'].toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
