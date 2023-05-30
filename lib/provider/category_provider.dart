import 'package:capstone_app/model/homeModel/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/homeModel/categoryicon_model.dart';
import '../view/homeScreen/home_screen.dart';

class CategoryProvider with ChangeNotifier{

HomeModel ? vegeData;
List <HomeModel> vegetables=[];
HomeModel ? fruitData;
List <HomeModel> fruittables=[];
HomeModel ? leafyData;
List <HomeModel> leafytables=[];
HomeModel ? datesData;
List <HomeModel> datestables=[];
HomeModel ? citrusData;
List <HomeModel> citrustables=[];


CategoryIcon? fruitIconData;
List<CategoryIcon> fruitIcon = [];
CategoryIcon? vegeIconData;
List<CategoryIcon> vegeIcon = [];
CategoryIcon? citrusIconData;
List<CategoryIcon> citrusIcon = [];
CategoryIcon? datesIconData;
List<CategoryIcon> datesIcon = [];
CategoryIcon? leafyIconData;
List<CategoryIcon> leafyIcon = [];

Future<void> getFruitIconData() async{
List<CategoryIcon>newList = [];
QuerySnapshot fruitIconSnapShot = await FirebaseFirestore.instance.collection('categoryicon').
doc('i2k0y34Hu86q9LUb55Bz').
collection('fruit').
get();
for (var element in fruitIconSnapShot.docs) { 
fruitIconData= CategoryIcon(image: element['image']);
newList.add(fruitIconData!);
}
 fruitIcon=newList;
}
List<CategoryIcon> get getFruitIconList{
  return fruitIcon;
} 

Future<void> getVegeIconData() async{
List<CategoryIcon>newList = [];
QuerySnapshot vegeIconSnapShot = await FirebaseFirestore.instance.collection('categoryicon').
doc('i2k0y34Hu86q9LUb55Bz').
collection('vegetable').
get();
for (var element in vegeIconSnapShot.docs) { 
vegeIconData= CategoryIcon(image: element['image']);
newList.add(vegeIconData!);
}
 vegeIcon=newList;
}
List<CategoryIcon> get getVegeIconList{
  return vegeIcon;
} 

Future<void> getCitrusIconData() async{
List<CategoryIcon>newList = [];
QuerySnapshot citrusIconSnapShot = await FirebaseFirestore.instance.collection('categoryicon').
doc('i2k0y34Hu86q9LUb55Bz').
collection('citrus').
get();
for (var element in citrusIconSnapShot.docs) { 
citrusIconData= CategoryIcon(image: element['image']);
newList.add(citrusIconData!);
}
 citrusIcon=newList;
}
List<CategoryIcon> get getCitrusIconList{
  return citrusIcon;
} 

Future<void> getDatesIconData() async{
List<CategoryIcon>newList = [];
QuerySnapshot datesIconSnapShot = await FirebaseFirestore.instance.collection('categoryicon').
doc('i2k0y34Hu86q9LUb55Bz').
collection('date').
get();
for (var element in datesIconSnapShot.docs) { 
datesIconData= CategoryIcon(image: element['image']);
newList.add(datesIconData!);
}
 datesIcon=newList;
}
List<CategoryIcon> get getDatesIconList{
  return datesIcon;
} 

Future<void> getLeafyIconData() async{
List<CategoryIcon>newList = [];
QuerySnapshot leafyIconSnapShot = await FirebaseFirestore.instance.collection('categoryicon').
doc('i2k0y34Hu86q9LUb55Bz').
collection('leafy').
get();
for (var element in leafyIconSnapShot.docs) { 
leafyIconData= CategoryIcon(image: element['image']);
newList.add(leafyIconData!);
}
 leafyIcon=newList;
}
List<CategoryIcon> get getLeafyIconList{
  return leafyIcon;
} 


  
Future<void> getVegeData() async{
List<HomeModel>newList = [];
QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance.collection('categories').
doc('ZuuhAMSxlIRsxooISrcd').
collection('vegeta').
get();
for (var element in vegeSnapShot.docs) {
  vegeData= HomeModel(image: element['image'], name: element['name'], price: element['price']);
newList.add(vegeData!);
}
 vegetables=newList;
}
List<HomeModel> get getVegeList{
  return vegetables;
} 

Future<void> getFruitData() async{
List<HomeModel>newList = [];
QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance.collection('categories').
doc('ZuuhAMSxlIRsxooISrcd').
collection('fruits').
get();
for (var element in vegeSnapShot.docs) {
  vegeData= HomeModel(image: element['image'], name: element['name'], price: element['price']);
newList.add(vegeData!);
}
 fruittables=newList;
}
List<HomeModel> get getFruitList{
  return fruittables;
} 
Future<void> getLeafytData() async{
List<HomeModel>newList = [];
QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance.collection('categories').
doc('ZuuhAMSxlIRsxooISrcd').
collection('leafy').
get();
for (var element in vegeSnapShot.docs) {
  vegeData= HomeModel(image: element['image'], name: element['name'], price: element['price']);
newList.add(vegeData!);
}
 leafytables=newList;
}
List<HomeModel> get getLeafyList{
  return leafytables;
} 
Future<void> getCitrusData() async{
List<HomeModel>newList = [];
QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance.collection('categories').
doc('ZuuhAMSxlIRsxooISrcd').
collection('citrus').
get();
for (var element in vegeSnapShot.docs) {
  vegeData= HomeModel(image: element['image'], name: element['name'], price: element['price'],);
newList.add(vegeData!);
}
 citrustables=newList;
}
List<HomeModel> get getCitrusList{
  return citrustables;
} 
Future<void> getDatesData() async{
List<HomeModel>newList = [];
QuerySnapshot vegeSnapShot = await FirebaseFirestore.instance.collection('categories').
doc('ZuuhAMSxlIRsxooISrcd').
collection('dates').
get();
for (var element in vegeSnapShot.docs) {
  vegeData= HomeModel(image: element['image'], name: element['name'], price: element['price']);
newList.add(vegeData!);
}
 datestables=newList;
}
List<HomeModel> get getDatesList{
  return datestables;
} 



List<HomeModel>? searchList;

void getSearchList({List<HomeModel>? list}) {
  searchList = list;
}

List<HomeModel> searchCategoryList(String query) {
  if (searchList == null) {
    return []; // Return an empty list or handle the null case appropriately.
  }
  
  List<HomeModel> searchResults = searchList!.where((element) {
    return element.name!.toUpperCase().contains(query.toUpperCase());
  }).toList();
  
  return searchResults;
}


}







// getVegedata(){
//  FirebaseFirestore.instance.
//     collection('categories').
//     doc('ZuuhAMSxlIRsxooISrcd').
//     collection('vegetables').get(

//     ).then((value){
//       for (var element in value.docs) {
//         vegetables.add(HomeModel.fromJson(element.data()));
//       }
//        vegetables=newList;
//     });
// }
