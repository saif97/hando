import 'package:cloud_firestore/cloud_firestore.dart';

final String COLLECTION_PRODUCTS = 'products2';
final String DOCUMENT_POPULAR_PRODUCTS_ID = '/rec_sys/popular_products';
final String DOCUMENT_User_REC_SYS_PRODUCTS_ID = '/rec_sys/user_based';

class FirebaseFacade {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllProducts() => instance.collection(COLLECTION_PRODUCTS).snapshots();

  Future<List> getPopularProducts() async =>
      (await instance.doc(DOCUMENT_POPULAR_PRODUCTS_ID).get()).data()['all'];

  Future<List> getUserRecSysProducts(String userName) async =>
      (await instance.doc(DOCUMENT_User_REC_SYS_PRODUCTS_ID).get()).data()[userName];
}
