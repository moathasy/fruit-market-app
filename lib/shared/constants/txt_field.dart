import 'package:flutter/material.dart';

Widget constantTxtField({

required TextEditingController ? controller,
bool isPassword = false,
required String hintText,
required IconData prefix,
required TextInputType type,
String? Function(String?)? validator,
IconData ? suffix,
Function? suffixPressed,
})=>TextFormField(

  validator: validator != null
          ? (value) => validator(value ?? '')
          : null,
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: hintText,
    contentPadding: EdgeInsets.only(top: 14),
    prefixIcon: Icon(prefix,color: Colors.green,),
    suffixIcon:suffix != null ? IconButton(
            onPressed:() => suffixPressed!(),
            icon: Icon(
                suffix
            ),
          ) : null,
  
    ),
   
    
  
  keyboardType:type ,
  obscureText: isPassword,
  controller: controller,
  style: TextStyle(
    color: Colors.black87,
  ),
  
);