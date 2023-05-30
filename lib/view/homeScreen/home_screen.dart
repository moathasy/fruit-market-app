// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:capstone_app/model/homeModel/categoryicon_model.dart';
import 'package:capstone_app/model/userModel/user_model.dart';
import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/detailsScreen/details_screen.dart';
import 'package:capstone_app/view/product/list_product.dart';
import 'package:capstone_app/view/product/single_product.dart';
import 'package:capstone_app/view/profileScreen/profile_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:capstone_app/model/homeModel/home_model.dart';
import 'package:flutter/material.dart';
import 'package:capstone_app/provider/category_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';
import '../cartScreen/cart_screen.dart';
import '../nontificationButton/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

CategoryProvider? categoryProvider;
ProductProvider? productProvider;
var featureSnapshot;
var newSnapshot;
var vegetables;

HomeModel? featdata1;
HomeModel? featdata2;
HomeModel? newdata1;
HomeModel? newData2;

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCategoriesProduct({String? image, int? color}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(color!),
      child: Image(image: NetworkImage(image!)),
    );
  }

  Widget _buildFeatures() {
    List<HomeModel> faetureProducts = productProvider!.getFeatureList;
    List<HomeModel> homeFeatureProduct;
    homeFeatureProduct = productProvider!.gethomeFeatureList;
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Featured',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      isCategory: false,
                      snapShot: faetureProducts,
                      name: 'Featured Products',
                    ),
                  ));
            },
            child: Text(
              'View more',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      SizedBox(
        height: 15,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: homeFeatureProduct.map((e) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => DetailsScreen(
                                      image: e.image,
                                      name: e.name,
                                      price: e.price),
                                ));
                          },
                          child: SingleProduct(
                              image: e.image, name: e.name, price: e.price),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (ctx) => DetailsScreen(
                        //               image: e.image,
                        //               name: e.name,
                        //               price: e.price),
                        //         ));
                        //   },
                        //   child: SingleProduct(
                        //       image: e.image,
                        //       name: e.name,
                        //       price: e.price),
                        // )
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      )
    ]);
  }

  Widget _buildUserAccountsDrawerHeader(){
    List<UserModel> userModel = productProvider!.userModelList;
  return Column(
    children: userModel.map((e) {
      return UserAccountsDrawerHeader(
                accountName: Text(e.userName!),
                accountEmail: Text(e.userEmail!),
                decoration: BoxDecoration(
                  color: Color(0xff5ac18e),
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/user2.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(e.image!),
                ),
              );
    }).toList()
  );
  }

  Widget _buildFruitIcon() {
    List<HomeModel> fruittables = categoryProvider!.getFruitList;
    List<CategoryIcon> fruitIcon = categoryProvider!.getFruitIconList;

    return Row(
      children: fruitIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListProduct(
                    name: "Fruits",
                    snapShot: fruittables,
                  ),
                ));
          },
          child: _buildCategoriesProduct(color: 0xff00A300, image: e.image),
        );
      }).toList(),
    );
  }

  Widget _buildVegeIcon() {
    List<HomeModel> vegetables = categoryProvider!.getVegeList;
    List<CategoryIcon> vegeIcon = categoryProvider!.getVegeIconList;

    return Row(
      children: vegeIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListProduct(
                    name: "vegetables",
                    snapShot: vegetables,
                  ),
                ));
          },
          child: _buildCategoriesProduct(color: 0xff00A300, image: e.image),
        );
      }).toList(),
    );
  }

  Widget _buildCitrusIcon() {
    List<HomeModel> citrustables = categoryProvider!.getCitrusList;
    List<CategoryIcon> citrusIcon = categoryProvider!.getCitrusIconList;

    return Row(
      children: citrusIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListProduct(
                    name: "Citrus",
                    snapShot: citrustables,
                  ),
                ));
          },
          child: _buildCategoriesProduct(color: 0xff00A300, image: e.image),
        );
      }).toList(),
    );
  }

  Widget _buildDatesIcon() {
    List<HomeModel> datestables = categoryProvider!.getDatesList;
    List<CategoryIcon> dateIcon = categoryProvider!.getDatesIconList;

    return Row(
      children: dateIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListProduct(
                    name: "Dates",
                    snapShot: datestables,
                  ),
                ));
          },
          child: _buildCategoriesProduct(color: 0xff00A300, image: e.image),
        );
      }).toList(),
    );
  }

  Widget _buildLeafyIcon() {
    List<HomeModel> leafytables = categoryProvider!.getLeafyList;
    List<CategoryIcon> leafyIcon = categoryProvider!.getLeafyIconList;

    return Row(
      children: leafyIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListProduct(
                    name: "Leafy vegetables",
                    snapShot: leafytables,
                  ),
                ));
          },
          child: _buildCategoriesProduct(color: 0xff00A300, image: e.image),
        );
      }).toList(),
    );
  }

  Widget _bulidCategory() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Text('View more',
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFruitIcon(),
              ////fruit
              SizedBox(
                width: 22,
              ),
              _buildVegeIcon(),
              SizedBox(
                width: 22,
              ),
              _buildCitrusIcon(),
              SizedBox(
                width: 22,
              ),
              _buildDatesIcon(),
              SizedBox(
                width: 22,
              ),
              _buildLeafyIcon(),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildNewProducts() {
    List<HomeModel> newProducts = productProvider!.getNewProductList;
    List<HomeModel> homeNewProduct;
    homeNewProduct = productProvider!.getHomeNewList;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                        isCategory: false,
                        snapShot: newProducts,
                        name: 'New Products',
                      ),
                    ));
              },
              child: Text('View more',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: homeNewProduct.map((e) {
                      return Row(
                        children: [
                          GestureDetector(
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
                            child: SingleProduct(
                                image: e.image, name: e.name, price: e.price),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => DetailsScreen(
                          //               image: e.image,
                          //               name: e.name,
                          //               price: e.price),
                          //         ));
                          //   },
                          //   child: SingleProduct(
                          //       image: e.image,
                          //       name: e.name,
                          //       price: e.price),
                          // )
                        ],
                      );
                    }).toList(),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider!.getVegeData();
    categoryProvider!.getFruitData();
    categoryProvider!.getLeafytData();
    categoryProvider!.getDatesData();
    categoryProvider!.getCitrusData();
    categoryProvider!.getFruitIconData();
    categoryProvider!.getVegeIconData();
    categoryProvider!.getCitrusIconData();
    categoryProvider!.getDatesIconData();
    categoryProvider!.getLeafyIconData();

    productProvider = Provider.of<ProductProvider>(context);
    productProvider!.getFeatureData();
    productProvider!.getNewProductData();
    productProvider!.gethomeFeatureData();
    productProvider!.getHomeNewData();
    productProvider!.getUserData();

    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Color(0xff5ac18e),
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
           NotificationButton()
          ],
        ),
        //
        drawer: Drawer(
          child: ListView(
            children: [
           _buildUserAccountsDrawerHeader(),
              ListTile(
                title: const Text("Account"),
                leading: const Icon(Icons.person_outline),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
              ),
              ListTile(
                title: const Text("Home"),
                leading: const Icon(Icons.home_outlined),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
              ),
              ListTile(
                title: const Text("Cart"),
                leading: const Icon(Icons.shopping_cart_outlined),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
              ),
              ListTile(
                title: const Text("About"),
                leading: const Icon(Icons.info_outline),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout_outlined),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    height: 200,
                    child: Carousel(
                      autoplay: true,
                      showIndicator: false,
                      images: [
                        AssetImage('assets/images/caro1.jpg'),
                        AssetImage('assets/images/caro2.jpg'),
                        AssetImage('assets/images/caro3.jpg'),
                        AssetImage('assets/images/caro4.jpg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _bulidCategory(),
                        SizedBox(height: 20),
                        _buildFeatures(),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            _buildNewProducts(),
                          ],
                        )
                      ])
                ]))));
  }
}
