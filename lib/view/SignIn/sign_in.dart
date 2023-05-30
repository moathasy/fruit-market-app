import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:capstone_app/shared/constants/txt_field.dart';
import 'package:capstone_app/shared/validation/validation.dart';
import 'package:capstone_app/view/SignUp/sign_up.dart';
import 'package:capstone_app/view/homeScreen/home_screen.dart';
import 'package:capstone_app/viewModel/SignIn/cubit.dart';
import 'package:capstone_app/viewModel/SignIn/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isRememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => SignInCubit(),
        child: Scaffold(
          body:  Stack(
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
                            'Sign In',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        BlocConsumer<SignInCubit, SignInStates>(
                          builder: (context, state) {
                            if (State is SignInLoadingStates) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
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
                                        controller: emailController,
                                        hintText: 'Email',
                                        prefix: Icons.email_outlined,
                                        type: TextInputType.emailAddress,
                                        validator:emailLoginValidator,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Text(
                                    'Password',
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
                                          controller: passwordController,
                                          hintText: 'Password',
                                          prefix: Icons.lock_outline_rounded,
                                          type: TextInputType.text,
                                          validator:passwordLoginValidator,
                                          isPassword: true)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: FractionalOffset.centerRight,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forget Password ?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor: Colors.white),
                                        child: Checkbox(
                                            checkColor: Colors.green,
                                            activeColor: Colors.white,
                                            value: isRememberMe,
                                            onChanged: (value) {
                                              setState(() {
                                                isRememberMe = value!;
                                              });
                                            }),
                                      ),
                                      const Text(
                                        'Remember me',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
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
                                                  .read<SignInCubit>()
                                                  .signInUser(
                                                    email: emailController.text
                                                        .trim(),
                                                    passsword: passwordController
                                                        .text
                                                        .trim(),
                                                  );
                                            
                                             }
                                             
                                          },
                                          child: const Text(
                                            'Sign In',
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t Have an Account ?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen(),
                                                ));
                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                
                                ],
                              );
                            }
                          },
                          listener: (context, state) {
                            if (state is SignInSuccessStates) {
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: AwesomeSnackbarContent(
                                  title: 'Hello Dear', color: Colors.green,
                                  message: 'Welcome${state.msg}',
    
                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              );
    
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            } else {
                              if (state is SignInErrorStates) {
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
                            }
    
                            if (state is SignInSuccessStates) {
                              
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
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
