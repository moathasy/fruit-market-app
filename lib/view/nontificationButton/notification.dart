import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/cartScreen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context){
    ProductProvider productProvider= Provider.of<ProductProvider>(context);
    return 
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Badge(
          alignment: AlignmentDirectional.bottomEnd,
         
          label: Text(productProvider.getCartModelListLength.toString()),
          backgroundColor: Colors.red,
          child: IconButton(icon: Icon(Icons.shopping_cart_outlined, color: Colors.white), onPressed: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
           },),
        
          ),
      );
  }
}