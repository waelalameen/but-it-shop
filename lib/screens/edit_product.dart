import 'package:buy_it_shop/constant.dart';
import 'package:buy_it_shop/model/product.dart';
import 'package:buy_it_shop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buy_it_shop/services/store.dart';

import '../model/product.dart';
import '../model/product.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kk'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: Store().loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var products = snapshot.data;
              return Container(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => Text(products[index].pName),
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
