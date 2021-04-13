import 'package:cloud_firestore/cloud_firestore.dart';

final String COLLECTION_PRODUCTS = 'test_products';

class FirebaseFacade {

  FirebaseFirestore instance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProducts() => instance.collection(COLLECTION_PRODUCTS).snapshots();
}
