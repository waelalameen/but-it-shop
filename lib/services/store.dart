import 'package:buy_it_shop/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buy_it_shop/constant.dart';
import 'package:meta/meta.dart';

import '../model/product.dart';
import '../model/product.dart';
import '../model/product.dart';
import '../model/product.dart';
import '../model/product.dart';

class Store {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //CollectionReference users = FirebaseFirestore.instance.collection(kProductsCollection);
  dynamic list;
  CollectionReference productsList =
      FirebaseFirestore.instance.collection(kProductsCollection);

  void addProduct(Product product) {
    list = _fireStore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductPrice: product.pPrice,
      kProductDescription: product.pDescription,
      kProductLocation: product.pLocation,
      kProductCategory: product.pCategory
    });
    print(list.length);
  }
  // Product product;
  // Future<void> addProduct() async{
  //   return await productsList.doc(kProductsCollection)
  //   .set({kProductName : product.pName,
  //   kProductPrice : product.pPrice,
  //   kProductDescription : product.pDescription,
  //   kProductLocation : product.pLocation,
  //   kProductCategory : product.pCategory});

  // }

  Stream<List<Product>> loadProducts() async* {
    List<Product> products = [];

    var snapshots = _fireStore.collection(kProductsCollection).snapshots();
    QuerySnapshot query = await snapshots.first;
    List<QueryDocumentSnapshot> docs = query.docs;

    for (var doc in docs) {
      var data = doc.data();
      products.add(
        Product(
          pName: data['productName'],
          pPrice: data['productPrice'],
          pDescription: data['productDescription'],
          pLocation: data['productLocation'],
          pCategory: data['productCategory'],
        ),
      );
    }
    yield products;
  }
}
