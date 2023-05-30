import 'package:capstone_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/homeModel/home_model.dart';
import '../product/single_product.dart';

class SearchProduct extends SearchDelegate<void>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
     IconButton(
      onPressed: (){
        query ='';
      }, 
      icon: Icon(Icons.close))
    ];
  
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
    onPressed: (){
      close(context, null);
    }, 
    icon: Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
  ProductProvider provider = Provider.of(context);
  List<HomeModel> ? searchProduct = provider.searchProductList(query);

  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: 0.86,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    children: searchProduct.map((e) => SingleProduct(
      image: e.image,
      name: e.name,
      price: e.price,
    )).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   ProductProvider provider = Provider.of(context);
  List<HomeModel> ? searchProduct = provider.searchProductList(query);

  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: 0.65,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    children: searchProduct.map((e) => SingleProduct(
      image: e.image,
      name: e.name,
      price: e.price,
    )).toList(),
    );
  }

}