// import 'package:bloc/bloc.dart';
// import 'package:capstone_app/viewModel/HomeModel/states.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../model/homeModel/home_model.dart';

// class HomeCubit extends Cubit<HomeStates>{

//   HomeCubit() : super(HomeInitState());
//   List<HomeModel> featuredData =[];
//   List<HomeModel> newData = [];


//   void getData(){
//     FirebaseFirestore.instance.
//     collection('products').
//     doc('52wCKyYArf9LBJOu0jvE').
//     collection('featureproduct').get(

//     ).then((value){
//       // for (var element in value.docs) {
//       //   featuredData.add(HomeModel.fromJson(element.data()));
//       // }
//      emit(HomeSuccessState());
//     }).catchError((onError){
//      emit(HomeErrorState());
//     });

//     FirebaseFirestore.instance.
//     collection('products')
//     .doc('Mlg92H3qSUlrWFY679rm').
//     collection('newproducts').get().then((value) {
//       // for (var element in value.docs) {
//       //   newData.add(HomeModel.fromJson(element.data()));
//       // }
//     }).catchError((onError){

//     });
//   }
// }