import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/screens/edit_product_screen.dart';
import 'package:flutter_complete_guide/screens/orders_screen.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import "./screens/products_overview_screen.dart";
import './screens/product_detail_screen.dart';
import 'providers/products.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
    //   // for 3.00 providers u use builder
    //   // for 4.00 version provider u use create
      create: (ctx) =>Products(),
    //OR USING THIS IN CHANGE NOTIFIERPROVIDER
    // return ChangeNotifierProvider.value(
    //   value: Products(),
        ),

        ChangeNotifierProvider(
          create: (ctx) =>Cart(),
          ),

        ChangeNotifierProvider.value(
          value: Orders()
          
          )

      ],


    
    
    
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx)=>ProductDetailScreen(),
          
          CartScreen.routeName : (ctx)=>CartScreen(),
          OrdersScreen.routeName: (ctx)=>OrdersScreen(),
          UserProductsScreen.routeName:(ctx)=>UserProductsScreen(),
          EditProductScreen.routeName: (ctx)=>EditProductScreen(),
       
        },
      ),
    );
  }
}

