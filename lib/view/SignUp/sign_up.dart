import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:capstone_app/shared/constants/txt_field.dart';
import 'package:capstone_app/shared/validation/validation.dart';
import 'package:capstone_app/view/SignIn/sign_in.dart';
import 'package:capstone_app/viewModel/SignIn/cubit.dart';
import 'package:capstone_app/viewModel/SignUp/cubit.dart';
import 'package:capstone_app/viewModel/SignUp/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



bool isPassword = true;

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var addressController = TextEditingController();
  


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    userNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ])),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 125,
                  ),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      BlocConsumer<SignUpCubit, SignUpStates>(
                        builder: (context, state) {
                          if (state is SignUpLoadingStates) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'User Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 60,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: constantTxtField(
                                     
                                      controller: userNameController,
                                      hintText: 'User name',
                                      prefix: Icons.person_2_outlined,
                                      type: TextInputType.name,
                                      validator: nameValidator,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text(
                                    'Email Address',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      height: 60,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      child: constantTxtField(
                                       validator: emailValidator,
                                        controller: emailController,
                                        hintText: 'Email',
                                        prefix: Icons.email_outlined,
                                        type: TextInputType.emailAddress,
                                      )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text(
                                    'password',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 60,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: constantTxtField(
                                      validator: passwordValidator,
                                      controller: passwordController,
                                      hintText: 'Password',
                                      prefix: Icons.lock_outline,
                                      type: TextInputType.text,
                                      isPassword: true
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text(
                                    'Phone Number',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 60,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: constantTxtField(
                                      validator: phoneValidator,
                                      controller: phoneController,
                                      hintText: 'Phone',
                                      prefix: Icons.local_phone_outlined,
                                      type: TextInputType.phone,
                                    ),
                                  
                                  ),
                                  const SizedBox(height: 25,),
                                   const Text(
                                    'Birth date',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 60,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: (){
                                        context.read<SignUpCubit>().selectDateTime(context);
                                      },
                                      child: AbsorbPointer(
                                        child: constantTxtField(
                                          hintText: "${context.read<SignUpCubit>().selectTime}",
                                          prefix: Icons.date_range_outlined,
                                          type: TextInputType.phone, controller: null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25,),
                                   const Text(
                                    'Address',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 60,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: constantTxtField(
                                      controller: addressController,
                                      hintText: 'Address',
                                      prefix: Icons.location_on_outlined,
                                      type: TextInputType.phone,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 25,
                                      ),
                                      child: ElevatedButton(
                                          onPressed: () {
                                         if (_formKey.currentState!.validate()) {
                                           context
                                                .read<SignUpCubit>()
                                                .signUpUser(
                                                    name:
                                                        userNameController.text,
                                                    email: emailController.text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim(),
                                                    phone: phoneController.text
                                                        .trim(),
                                                        address: addressController.text,
                                                        date: context.read<SignUpCubit>().selectTime.toString(),
                                                        );
                                         }  
                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                              Colors.white,
                                            ),
                                          )),
                                    ),
                                  ),
                                ]);
                          }
                        },
                        listener: (context, state) {
                          if (state is SignUpSuccessStates) {
                            final snackBar = SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green,
                              content: AwesomeSnackbarContent(
                                title: 'Welcome Back ${state.msg}',
                                color: Colors.green,
                                message: 'Please Sign In',
    
                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.failure,
                              ),
                            );
    
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          } else if (state is SignUpErrorStates) {
                            final snackBar = SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              content: AwesomeSnackbarContent(
                                title: 'Warning', color: Colors.red,
                                message: '${state.msgError.toString()}',
    
                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.failure,
                              ),
                            );
    
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
    
                          if (state is SignUpSuccessStates) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
