import 'dart:developer';

import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/cartScreen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CartSingleProduct extends StatefulWidget {
  final String? image;
  final String? name;
  int? quantity;
  final String? price;
  bool? isCount;
  int? index;

  CartSingleProduct(
      {super.key,
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.isCount,
      this.index});

  @override
  State<CartSingleProduct> createState() => _CartSingleProductState();
}

class _CartSingleProductState extends State<CartSingleProduct> {
  late ProductProvider productProvider =
      Provider.of<ProductProvider>(context, listen: false);

  @override
  void initState() {
    log("image ${widget.image}");
    log("name ${widget.name}");
    log("quantity ${widget.quantity}");
    log("price ${widget.price}");
    log("isCount ${widget.isCount}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      
      width: double.infinity,
      child: Card(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 120,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(widget.image!))),
                ),
                Container(
                  height: 140,
                  width: 253,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name!,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (widget.quantity! > 1) {
                                      widget.quantity = widget.quantity! - 1;
                                    } else {
                                      productProvider
                                        .deleteCartData(widget.index); // Set isCount to true to hide the widget
                                    }
                                    
                                  });
                                },
                                icon: Icon(Icons.delete,
                                    color: Color.fromARGB(255, 140, 194, 166)),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${widget.name}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ ${widget.price}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                        Container(
                            height: 25,
                            width: widget.isCount == false ? 120 : 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 140, 194, 166),
                            ),
                            child: widget.isCount == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.remove),
                                        onTap: () {
                                          setState(() {
                                            productProvider.getCartData(
                                                quantity: widget.quantity,
                                                image: widget.image,
                                                name: widget.name,
                                                price: widget.price);
                                            if (widget.quantity! > 1) {
                                              widget.quantity =
                                                  widget.quantity! - 1;
                                            }
                                          });
                                        },
                                      ),
                                      Text(widget.quantity.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.add,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            productProvider.getCartData(
                                                quantity: widget.quantity,
                                                image: widget.image,
                                                name: widget.name,
                                                price: widget.price);
                                            widget.quantity =
                                                widget.quantity! + 1;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(3.5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Quantity'),
                                        Text(widget.quantity.toString())
                                      ],
                                    ),
                                  )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
