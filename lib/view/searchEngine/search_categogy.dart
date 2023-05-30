import 'package:capstone_app/model/homeModel/home_model.dart';
import 'package:capstone_app/provider/category_provider.dart';
import 'package:capstone_app/view/product/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCategory extends SearchDelegate<void>{
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
  CategoryProvider provider = Provider.of(context);
  List<HomeModel> ? searchProduct = provider.searchCategoryList(query);

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
   CategoryProvider provider = Provider.of(context);
  List<HomeModel> ? searchProduct = provider.searchCategoryList(query);

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