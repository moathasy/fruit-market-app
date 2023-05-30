import 'package:capstone_app/view/cartScreen/cart_singleproduct.dart';
import 'package:capstone_app/view/checkoutScreen/checkout_screen.dart';
import 'package:capstone_app/view/nontificationButton/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        height: 60,
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff5ac18e)),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => CheckoutScreen()),
            );
          },
          child: Text(
            'Check Out',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Basket'),
        backgroundColor: const Color(0xff5ac18e),
        actions: [
          NotificationButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCartModelListLength,
        itemBuilder: (context, index) => CartSingleProduct(
          index: index,
          image: productProvider.getCartModelList[index].image,
          isCount: false,
          name: productProvider.getCartModelList[index].name,
          price: productProvider.getCartModelList[index].price,
          quantity: productProvider.getCartModelList[index].quantity,
        ),
      ),
    );
  }
}


