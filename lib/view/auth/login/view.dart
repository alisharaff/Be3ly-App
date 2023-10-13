import 'package:be3ly/view/forget_password/view.dart';
import 'package:be3ly/view/screen/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/app_button.dart';
import '../../../core/constants.dart' as constants;

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  void _signInWithEmailAndPassword() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Simulate a delay for demonstration purposes
      await Future.delayed(Duration(seconds: 2));

      // Authentication successful
      final snackBar = SnackBar(
        content: Text('Login successful'),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.to(HomeScreen());

    } catch (e) {
      // Authentication failed, handle the error
      print('Authentication failed: $e');

      final snackBar = SnackBar(
        content: Text('Login failed'),
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * .0418,
            horizontal: 14.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      // Validate email here
                      return null; // Return null for no validation error
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      // Validate password here
                      return null; // Return null for no validation error
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(ForgetPasswordView());
                      },
                      child: const Text(
                        'Forgot your password? ',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .03448,
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: constants.primaryAppColor,
                        )) // Display loading indicator
                      : AppButton(
                          title: 'LOGIN',
                          onTap: _signInWithEmailAndPassword,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
