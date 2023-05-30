import 'package:capstone_app/model/homeModel/home_model.dart';
import 'package:capstone_app/provider/category_provider.dart';
import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/product/single_product.dart';
import 'package:capstone_app/view/searchEngine/search_categogy.dart';
import 'package:capstone_app/view/searchEngine/search_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detailsScreen/details_screen.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  bool ? isCategory = true;
   List<HomeModel> snapShot;
  
   ListProduct({required this.snapShot,this.name, super.key,this.isCategory});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
        actions: [
         isCategory==true? IconButton(
            onPressed: () {
              categoryProvider.getSearchList(list: snapShot);
              showSearch(context: context, delegate: SearchCategory());
            },
            icon: Icon(Icons.search),
          ):
          IconButton(onPressed: () {
            productProvider.getSearchList(list: snapShot);
            // productProvider.getSearchList();
            showSearch(context: context, delegate: SearchProduct());
          }, icon: Icon(Icons.search))
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 600,
            child: GridView.count(     
              childAspectRatio: 0.7,   
              scrollDirection: Axis.vertical, crossAxisCount: 2,
              children: snapShot.map((e) => GestureDetector(
                  onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      image: e.image,
                                      name: e.name,
                                      price: e.price),
                                ),
                              );
                            },
                child: SingleProduct(image: e.image,name: e.name,price: e.price,))).toList(),
             )
                 ) ] )
      ),
    );
  }
}
