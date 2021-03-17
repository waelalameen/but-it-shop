import 'package:buy_it_shop/constant.dart';
import 'package:buy_it_shop/model/product.dart';
import 'package:buy_it_shop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buy_it_shop/services/store.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  
  @override
  Widget build(BuildContext context) {
    
    List _products = [];
    dynamic result;
    fechProductsList() async {
       result = await Store().loadProducts();
       
        
print('length = ${result.length}');
      
      if (result == null) {
        print('unable to retrieve');
      } else {
        setState(() {
          _products = result;
        });
      }   
   
    }
    
     

    @override
    void initState() {
      super.initState();
      fechProductsList();
      
    }
    
 print('length products = ${_products.length}');
 

    return Scaffold(
      appBar: AppBar(
        title:Text('kk'),
      ),
      
      body: Center(
        child: Container(
          
             
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) =>
               Text(_products[index].kProductName),
              
               
            ),
            
          ),
      ),
    );
    
  }
}
