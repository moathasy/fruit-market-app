import 'package:bloc/bloc.dart';
import 'package:capstone_app/provider/category_provider.dart';
import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/services/bloc.dart';
import 'package:capstone_app/view/cartScreen/cart_screen.dart';
import 'package:capstone_app/view/checkoutScreen/checkout_screen.dart';
import 'package:capstone_app/view/detailsScreen/details_screen.dart';
import 'package:capstone_app/view/homeScreen/home_screen.dart';
import 'package:capstone_app/view/profileScreen/profile_screen.dart';
import 'package:capstone_app/view/splashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'view/checkoutScreen/confirmation_screen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
 SystemChrome.setEnabledSystemUIOverlays([]);
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen())
      );
  }
}


  