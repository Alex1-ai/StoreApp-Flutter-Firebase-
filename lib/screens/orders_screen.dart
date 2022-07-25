import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  
  static const routeName = "/orders";

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
//  var  _isLoading = false;
//  @override
//   void initState() {
//     // TODO: implement initState
//     // Future.delayed(Duration.zero).then((_)async{

//       //   _isLoading =true;
   
//       // Provider.of<Orders>(context, listen: false)
//       // .fetchAndSetOrders().then((_){
//       // setState(() {
//       //   _isLoading=false;
//       // });
//   // });

//     // });
//     super.initState();
//   } 
  Future _ordersFuture;

  Future _obtainOrdersFuture(){
    return Provider.of<Orders>(context, listen: false)
      .fetchAndSetOrders() ;
    
  }
  @override
  void initState() {
    // TODO: implement initState
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }
  Widget build(BuildContext context) {
    //final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Your Orders")
      ),
      drawer: AppDrawer(),

      body: FutureBuilder(
        future:_ordersFuture,
      builder: ((ctx, dataSnapshot){
       if( dataSnapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
       }else{
        if (dataSnapshot.error != null){
          // do error handling
          return Center(child: Text("An error occurred!"),);
        }else{

           return Consumer<Orders>(
            builder:(ctx, orderData, child)=>ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i)=>OrderItem(orderData.orders[i]),
              )
             ,);
        }
       }

      }),
      )
       
       

    );
  }
}