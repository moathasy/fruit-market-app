import 'dart:io';

import 'package:capstone_app/model/userModel/user_model.dart';
import 'package:capstone_app/provider/product_provider.dart';
import 'package:capstone_app/view/homeScreen/home_screen.dart';
import 'package:capstone_app/view/nontificationButton/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:capstone_app/viewModel/SignUp/cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProductProvider? productProvider;
  User? user = FirebaseAuth.instance.currentUser;

  UserModel? userModel;
  TextEditingController? phoneNumber;
  TextEditingController? address;
  TextEditingController? userName;

  @override
  void initState() {
    super.initState();
    userName = TextEditingController(text: user!.displayName);
    address = TextEditingController();
    phoneNumber = TextEditingController();
  }

  // var imageMap;
  // var imagePath;

  File? _pickedImage;
  final imagePicker = ImagePicker();
  getImage({ImageSource? source}) async {
    var pickedImage = await imagePicker.pickImage(source: source!);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    } else {}
  }

  // void userDetailUpdate(){

  //   FirebaseFirestore.instance.collection('users').doc(user.uid)
  // }

  String? imageUrl;
  void uploadImage({File? image}) async {
    User? user = FirebaseAuth.instance.currentUser;
    Reference storageRefrence =
        FirebaseStorage.instance.ref().child("image/${user!.uid}");
    UploadTask uploadTask = storageRefrence.putFile(image!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    imageUrl = await snapshot.ref.getDownloadURL();
  }

  String? userUid;

  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser!.uid;
  }

// File ? pickedImage;
// PickedFile ? _image;
// Future<void>getImage({ImageSource ? source})async{
// _image = (await ImagePicker().pickImage(source: source!)) as PickedFile?;
// if (_image != null) {
//   pickedImage = File(pickedImage!.path);
// } else {}
// }
  Widget _buildContainerPart() {
    List<UserModel> userModel = productProvider!.userModelList;
    return Column(
      children: userModel.map((e) {
        return Column(
          children: [
            _buildSingleContainer(fName: 'Name', lName: e.userName),
            const SizedBox(
              height: 15,
            ),
            _buildSingleContainer(fName: 'E-mail', lName: e.userEmail),
            const SizedBox(
              height: 15,
            ),
            _buildSingleContainer(fName: 'Phone', lName: e.phoneNumber),
            const SizedBox(
              height: 15,
            ),
            _buildSingleContainer(fName: 'Address', lName: e.address),
          ],
        );
      }).toList(),
    );
  }

  void updateUserDetail() async {
    String uid = user!.uid; // Get the user's UID
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': userName?.text,
      'address': address?.text,
      'phone': phoneNumber?.text,
    });
    setState(() {
      edit = false;
    });
  }

// to choose photo from camera or gallery //
  Future<void> getDialogBox() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Upload from camera'),
                onTap: () {
                  getImage(source: ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Upload from galllery'),
                onTap: () {
                  getImage(source: ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              )
            ]),
          ),
        );
      },
    );
  }

  Widget _buildTxtFieldPart() {
    List<UserModel> userModel = productProvider!.userModelList;
    return SingleChildScrollView(
      child: Column(
        children: userModel.map((e) {
          return Column(
            children: [
              _buildSingleTxtField(
                name: e.userName,
                controller: userName,
              ),
              const SizedBox(
                height: 15,
              ),
              _buildSingleContainer(fName: 'E-mail', lName: e.userEmail),
              const SizedBox(
                height: 15,
              ),
              _buildSingleTxtField(
                name: e.phoneNumber,
                controller: phoneNumber,
              ),
              const SizedBox(height: 15,),
              _buildSingleTxtField(
                name: e.address,
                controller: address,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSingleContainer({String? fName, String? lName}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side: BorderSide(color: Colors.grey)),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fName!),
            Text(
              lName!,
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTxtField(
      {String? name, TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              )
            : IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_back_outlined)),
        backgroundColor: const Color(0xff5ac18e),
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  onPressed: () {
                    updateUserDetail();
                    uploadImage(image: _pickedImage);
                    setState(() {
                      edit = false;
                    });
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(children: [
              SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: _pickedImage != null
                            ? FileImage(_pickedImage!)
                            : const AssetImage('assets/images/user.png')
                                as ImageProvider<Object>,
                        maxRadius: 65,
                      ),
                    ],
                  )),
              edit == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 210, top: 80),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            // uploadImage();
                            getDialogBox();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: const Icon(Icons.camera_alt_outlined,
                                color: Color(0xff5ac18e)),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ]),
             Column(
                children: [
                  Container(
                      height: 320,
                      child: edit == true
                          ? _buildTxtFieldPart()
                          : Container(
                              height: 250, child: _buildContainerPart()))
                ],
              ),
          
            edit == false
                ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Color(0xff5ac18e),
                    )),
                    onPressed: () {
                      setState(() {
                        edit = true;
                      });
                    },
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
