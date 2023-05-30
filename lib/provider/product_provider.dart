import 'package:capstone_app/model/cartModel/cart_model.dart';
import 'package:capstone_app/model/homeModel/categoryicon_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/homeModel/home_model.dart';
import '../model/userModel/user_model.dart';

class ProductProvider with ChangeNotifier {
  HomeModel? featureData;
  List<HomeModel> faeturetables = [];
  HomeModel? newProductData;
  List<HomeModel> newProducttables = [];
  HomeModel? homeFeatureData;
  List<HomeModel> homeFeature = [];
  HomeModel? homeNewData;
  List<HomeModel> homeNew = [];

  List<CartModel>cartModelList=[];
  CartModel ? cartModel;
  List<UserModel>userModelList=[];
  UserModel ? userModel;

  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User ? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot = await FirebaseFirestore.instance
        .collection('users')
        .get();
    for (var element in userSnapShot.docs) {
      if(currentUser!.uid == element['uid'] ){
         userModel = UserModel(
          userName: element['name'], 
          userEmail: element['email'], 
          phoneNumber: element['phone'],
          image: element['image'],
          address: element['address']
          );
          newList.add(userModel!);
      }
      userModelList=newList;
    }
    // newProducttables = newList;

  }

 List <UserModel>  get getUserModelList {
    return userModelList;
  }


  


  List<String>notificationList=[];
  
  void addNotification({ String ? notification}){
    notificationList.add(notification!);
  }
  
  int get getNotificationIndex{
    return notificationList.length;
  }

  void deleteCartData(int ? index){
    cartModelList.removeAt(index!);
    notifyListeners();
  }


  void getCartData({
    String ? image,
    String ? name,
    String ? price,
    int ? quantity,

  }){

    cartModel = CartModel(image: image, name: name, price: price, quantity: quantity);

    cartModelList.add(cartModel!);

  }
  List<CartModel> get getCartModelList{
    return cartModelList;
  }

  int get getCartModelListLength{
    return cartModelList.length;
  }
  





  Future<void> getFeatureData() async {
    List<HomeModel> newList = [];
    QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance
        .collection('products')
        .doc('52wCKyYArf9LBJOu0jvE')
        .collection('featureproduct')
        .get();
    for (var element in vegeSnapShot.docs) {
      featureData = HomeModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);
      newList.add(featureData!);
    }
    faeturetables = newList;
    notifyListeners();
  }

  List<HomeModel> get getFeatureList {
    return faeturetables;
  }

  Future<void> getNewProductData() async {
    List<HomeModel> newList = [];
    QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance
        .collection('products')
        .doc('Mlg92H3qSUlrWFY679rm')
        .collection('newproducts')
        .get();
    for (var element in vegeSnapShot.docs) {
      newProductData = HomeModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);
      newList.add(newProductData!);
    }
    newProducttables = newList;
  }

  List<HomeModel> get getNewProductList {
    return newProducttables;
  }

   Future<void> gethomeFeatureData() async {
    List<HomeModel> newList = [];
    QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance
        .collection('homefeatuer')
        .get();
    for (var element in vegeSnapShot.docs) {
      featureData = HomeModel(
          image: element['image'],
          name: element['name'],
          price: element['price']);
      newList.add(featureData!);
    }
    homeFeature = newList;
    notifyListeners();
  }

  List<HomeModel> get gethomeFeatureList {
    return homeFeature;
  }

  Future<void> getHomeNewData() async {
    List<HomeModel> newList = [];
    QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance
        .collection('homenew')
        .get();
    for (var element in vegeSnapShot.docs) {
      featureData = HomeModel(
          image: element['image'],
          name: element['name'],
          price: element['price'],
          
          );
          
      newList.add(featureData!);
    }
    homeNew = newList;
    notifyListeners();
  }

  List<HomeModel> get getHomeNewList {
    return homeNew;
  }


List<HomeModel>? searchList;

void getSearchList({List<HomeModel>? list}) {
  searchList = list;
}

List<HomeModel> searchProductList(String query) {
  if (searchList == null) {
    return []; // Return an empty list or handle the null case appropriately.
  }
  
  List<HomeModel> searchResults = searchList!.where((element) {
    return element.name!.toUpperCase().contains(query.toUpperCase());
  }).toList();
  
  return searchResults;
}

}
