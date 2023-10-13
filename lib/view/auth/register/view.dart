import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants.dart' as constants;
import '../../../core/constants.dart';
import '../../../core/functions/validator/validator.dart';
import '../../../core/widget/app_button.dart';
import '../../../core/widget/app_text.dart';
import '../../../core/widget/app_text_form_field.dart';
import '../../../core/widgets/loading_button.dart';
import '../login/view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name, phone;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final phoneFocusNode = FocusNode(); // Corrected variable name
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * .11, left: 14.0, right: 14, bottom: height * .0418),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Sign up",
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height * .0899,
                  ),
                  AppTextFormField(
                    controller: nameController,
                    onChange: (data) {
                      name = data;
                    },
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(emailFocusNode);
                    },
                    hintText: 'Name',
                    keyBoardType: TextInputType.text,
                    validator: (value) {
                      return Validator.validateName(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFormField(
                    controller: emailController,
                    onChange: (data) {
                      email = data;
                    },
                    keyBoardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(phoneFocusNode);
                    },
                    hintText: 'Email',
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFormField(
                    controller: phoneController,
                    onChange: (data) {
                      phone = data;
                    },
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    keyBoardType: TextInputType.phone,
                    hintText: 'Phone',
                    validator: (value) {
                      return Validator.validatePhone(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextFormField(
                    controller: passwordController,
                    onChange: (data) {
                      password = data;
                    },
                    keyBoardType: TextInputType.visiblePassword,
                    secure: true,
                    textInputAction: TextInputAction.done,
                    hintText: 'Password',
                    validator: (value) {
                      return Validator.validatePassword(value);
                    },
                  ),
                  SizedBox(
                    height: height * .034482,
                  ),
                  Builder(
                    builder: (context) {
                      return RegisterButton(
                        email: email,
                        password: password,
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: email ?? "",
                              password: password ?? "",
                            );

                            // Registration was successful
                            // You can navigate to the next screen or perform other actions here
                          } catch (e) {
                            // Registration failed, handle the error
                            print('Registration failed: $e');
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => LoginView());
                      },
                      child: const AppText(
                        text: 'Already have an account? ',
                      ),
                    ),
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

class RegisterButton extends StatelessWidget {
  final String? email;
  final String? password;
  final VoidCallback onPressed;

  const RegisterButton({
    Key? key,
    required this.email,
    required this.password,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(title: 'SignUp', onTap: onPressed);
  }
}
