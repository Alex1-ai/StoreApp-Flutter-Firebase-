import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import "package:provider/provider.dart";


class ProductDetailScreen extends StatelessWidget {
//  final String title;
//  final double price;


//  ProductDetailScreen(this.title, this.price);
  static const routeName = "/product-detal";
  @override
  Widget build(BuildContext context) {
    // extracting data from arguments sent from routing
    final productId = ModalRoute.of(context).settings.arguments as String;
    // listen is set to false to avoid the 
    // app build from repainting
    final loadedProduct = Provider.
    of<Products>(
      context,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      
      
      
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:300,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ) ,
            ),

            SizedBox(height: 10,),
            Text("\$${loadedProduct.price},",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            
            ),

            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10
              ),
              width:double.infinity,
              child: Text(loadedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
               ),
            )
          ],
        ),
      )
    );
    
  }
}