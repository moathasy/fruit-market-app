import 'dart:developer';

import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/cartScreen/cart_singleproduct.dart';
import 'package:capstone_app/view/checkoutScreen/confirmation_screen.dart';
import 'package:capstone_app/view/nontificationButton/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late ProductProvider productProvider = Provider.of<ProductProvider>(context,listen: false);
   double subtotal = 0;
    double total = 0;

  Widget _buildTotalDetails({String? type, String? num}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type!,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          num!,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }

  @override
  void initState() {
    log("+++++++++++++++++++ checkout screen ++++++++++++++++++++");
   getCartData();
    super.initState();
  }
User ? user;
 int ? index; 
  Widget _buildBuyButton(){
    return Column(
      children: productProvider.userModelList.map((e) {
      return  ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff5ac18e)),
          ),
          onPressed: () {
             FirebaseFirestore.instance.collection('orders').doc(user!.uid).set({
              'product':productProvider.cartModelList.map((c) => {
                 'product name':c.name,
                  'product price':c.price,
                  'product quantity':c.quantity,
                  'total price':total,
              }),
                  
                  'name':e.userName,
                  'email':e.userEmail,
                  'uid':user!.uid,
                 });
                 Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrderScreen(),));
          },
          child: Text(
            'Place Order',
            style: TextStyle(fontSize: 18),
          ),
        );
      }).toList()
    );
  }


  void getCartData (){
    productProvider.getCartModelList.forEach((element) {
      double price = double.tryParse(element.price ?? '0') ?? 0;
      subtotal += price * (element.quantity ?? 0);
    });
       total += subtotal;

   
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    int ? index;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        height: 60,
        width: 150,
        child: _buildBuyButton(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout'),
        backgroundColor: const Color(0xff5ac18e),
        actions: [
          NotificationButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                      //  width: double.infinity, 
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productProvider.getCartModelListLength,
                    itemBuilder: ( ctx,  myindex) {
                    index=myindex;
                      return CartSingleProduct(
                        index: index,
                        isCount: true,
                        image: productProvider.getCartModelList[myindex].image,
                        name: productProvider.getCartModelList[myindex].name,
                        price: productProvider.getCartModelList[myindex].price,
                        quantity: productProvider.getCartModelList[myindex].quantity,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTotalDetails(
                        type: 'Basket total',
                        num: '\$ ${subtotal.toStringAsFixed(2)}'),
                    _buildTotalDetails(type: 'Delivery fee', num: '\$ 00.00'),
                    _buildTotalDetails(type: 'Service fee', num: '\$ 00.00'),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total amount',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ ${total.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
