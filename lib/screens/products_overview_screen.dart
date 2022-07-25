import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:flutter_complete_guide/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../widgets/product_grid.dart';


enum FilterOptions {
  Favorites, 
  All
}

class ProductOverviewScreen extends StatefulWidget {
 
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoritesOnly = false;
  var _isInit = true;
  var _isLoading =false;

  @override
  void initState() {
    // TODO: implement initState
    // Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    super.initState();
  }
  
  // @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      _isLoading = true;
      Provider.of<Products>(context).
      fetchAndSetProducts().then((_){
        setState(() {
          _isLoading = false;
          
        });
        
      });

    }
     _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
     final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:Text("MyShop"),
        actions: [

          Consumer<Cart>( builder: (_, cart,ch) =>
              Badge(
                child:ch ,
            
            value: cart.itemCount.toString()
            
            ),
            child: IconButton(
            icon:Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
            }
            ),
           
           ),
          PopupMenuButton(



            onSelected: (FilterOptions selectedValue){
              print(selectedValue);
              setState(() {
                  if (selectedValue == FilterOptions.Favorites){
                // productsContainer.showFavoritesOnly();
             
                 _showFavoritesOnly= true;
              } else{
                // productsContainer.showAll();
                _showFavoritesOnly = false;

              }
                
              });
            
            },


            icon: Icon(Icons.more_vert),
            
            itemBuilder: (_) =>[
              


              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilterOptions.Favorites,
              ),

              PopupMenuItem(
                child: Text("Show All"),
                value:FilterOptions.All,
              ),
            ]
            ),


           
        ],

      ),
      drawer: AppDrawer(),
      body:_isLoading ? 
      Center(child: CircularProgressIndicator(),)
      :
      ProductGrid(_showFavoritesOnly),

    );
  }
}

