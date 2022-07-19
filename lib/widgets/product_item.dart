import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    // setting up a provider to pass data
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print("Product rebuilds");
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          
          child: GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                   arguments: product.id,
                  
                  );
              },
              child: Image.network(product.imageUrl,
              fit: BoxFit.cover,
                
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              
              
              // consumer makes only part  run 
              // and not the entire widgets
              leading: Consumer<Product>(
      builder: (ctx, product, child)=> IconButton(
                onPressed: (){
                  product.toggleFavoriteStatus();
                },
                 icon: Icon( product.isFavorite? Icons.favorite: Icons.favorite_border),
                 color: Colors.pinkAccent,
                 ),),
              
              title:Text(
                product.title, 
                textAlign: 
                TextAlign.center,),
      
                trailing: IconButton(
                  onPressed:(){
                    cart.addItem(
                       product.id, product.price, product.title
                       );

                       // ignore: deprecated_member_use
                       ScaffoldMessenger.of(context).hideCurrentSnackBar();
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Added item to cart",
                        // textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.teal,
                        duration: Duration(seconds:5),
                        action:SnackBarAction(
                          label: "UNDO", textColor: Colors.red,
                          onPressed: (){
                            cart.removeSingleItem(product.id);


                          }) ,

                       ));

                  },
                   icon: Icon(Icons.shopping_cart),
                   color: Colors.green,
                   ),
            ),
            ),
          
          ),
      
      
    );
    
  }
}