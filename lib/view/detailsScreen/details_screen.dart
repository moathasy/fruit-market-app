import 'package:capstone_app/view/cartScreen/cart_screen.dart';
import 'package:capstone_app/view/nontificationButton/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class DetailsScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? price;
  final String ? description;
  const DetailsScreen({this.image, this.name, this.price,this.description ,super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1;
  
  @override
  Widget build(BuildContext context) {
   ProductProvider ? productProvider;
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
        actions: [
          NotificationButton(),
        ],
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  NetworkImage(widget.image!))),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name!,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.price!,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            Text(
                              'Descreption',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Wrap(
                children: [
                  Text(
                    'Papaya fruit is a nutritional powerhouse, offering a range of health benefits. Packed with antioxidants like vitamin C, carotenoids, and flavonoids, papaya supports a strong immune system and helps fight off harmful free radicals. Its natural enzyme, papain, aids in digestion, promoting a healthy gut. The fiber and potassium in papaya contribute to heart health by maintaining healthy blood pressure levels and reducing cholesterol. The combination of vitamins A and C in papaya nourishes the skin, supports collagen production, and improves vision. Additionally, papaya\'s anti-inflammatory properties, weight management support, hair health benefits, and potential anticancer properties make it a valuable addition to a well-rounded diet. Enjoying papaya regularly can enhance your overall well-being and contribute to a healthier lifestyle.',                                                                                                                                                                                       
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text('Quantity',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff5ac18e),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.remove),
                          onTap: () {
                            setState(() {
                              if (count > 1) {
                                count--;
                              }
                            });
                          },
                        ),
                        Text(count.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        GestureDetector(
                          child: Icon(
                            Icons.add,
                          ),
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      productProvider!.getCartData(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price,
                        quantity: count,
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartScreen(),));
                    },
                    child: const Text(
                      'Add to basket',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xff5ac18e),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
