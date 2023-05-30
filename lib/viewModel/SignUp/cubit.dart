import 'dart:developer';
import 'package:capstone_app/viewModel/SignUp/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitStates());

  DateTime selectTime = DateTime.now();

  void signUpUser({
    String? name,
    String? email,
    String? password,
    String? phone,
    String ? address,
    String? date,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      log(value.user!.uid.toString());
      saveData( name, email, value.user!.uid.toString(),phone ,address, date);
      emit(SignUpSuccessStates(msg: name.toString()));
    }).catchError((onError) {
      log(onError.toString());
      emit(SignUpErrorStates(msgError: onError.toString()));
    });

    
  }
  void saveData(
      String ? name,
      String ? email,
      String ? uid,
      String ? phone,
      String ? address,
      String? date,
      // String ? image,
    ){

      FirebaseFirestore.instance.collection("users").doc(uid).set({
        "name": name,
        "email": email,
        "uid": uid,
        "phone":phone,
        // 'image':image,
        'address':address,
        'date':date,
      }).then((value){
        emit(SignUpSuccessStates());
      }).catchError((onError){
        emit(SignUpErrorStates());
      });

    }

    selectDateTime(BuildContext context) async {
    //

    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: selectTime,
        firstDate: DateTime(1970),
        lastDate: DateTime(2099));

    if (picker != null) {
      selectTime = picker;
    }

    emit(SignUpPickDateStates());
  }
}
