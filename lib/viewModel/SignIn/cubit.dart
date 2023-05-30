import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:capstone_app/viewModel/SignIn/states.dart';
import 'package:capstone_app/viewModel/SignUp/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInCubit extends Cubit<SignInStates>{

  SignInCubit() : super(SignInInitStates());

  void signInUser({
    String ? email,
    String ? passsword,

  }){
    
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!, 
      password: passsword!).then((value) {
         log(value.user!.email.toString());
       emit(SignInSuccessStates(msg:value.user!.email.toString() ));
      }).catchError((onError){
       log(onError.toString());
       emit(SignInErrorStates(msgError: onError.toString()));
      });

  }
}