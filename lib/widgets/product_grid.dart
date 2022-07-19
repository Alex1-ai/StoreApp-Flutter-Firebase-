
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';


import './product_item.dart';


class ProductGrid extends StatelessWidget {
  final bool showFavs;
  ProductGrid(this.showFavs);


  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFavs? productData.favoriteItems  : productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // the num of columns
        crossAxisCount: 2,
        // makes the height more than the width
        childAspectRatio: 3 / 2,
        // spacing between the columns
        crossAxisSpacing: 10,
        // spacing between the rows
        mainAxisSpacing: 10,

        ),
       itemBuilder: (ctx, i)=>
      //  ChangeNotifierProvider(
      //    create: (c) => products[i],
      //OR YOU CAN USE CHANGE NOTIFIER HERE TO 
      // =
      ChangeNotifierProvider.value(
        value: products[i], 

         child: ProductItem(
          // products[i].id,
          // products[i].title, 
          // products[i].imageUrl,
          ),
       ),
       );
  }
}