
import 'package:be3ly/view/login/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';
import '../../core/core/assets/app_assets.dart';
import '../../core/core/router/router.dart';
import '../../core/core/validator/validator.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../../core/widgets/loading_button.dart';
import '../../core/widgets/social_media_button.dart';
import '../forget_password/view.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.of(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
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
                  vertical: height * .0418, horizontal: 14.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: cubit.formKey,
                  autovalidateMode: cubit.autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Login",
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 73,
                      ),
                      AppTextFormField(
                        onSave: (data) {
                          cubit.email = data;
                        },
                        keyBoardType: TextInputType.emailAddress,
                        focusNode: cubit.emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(cubit.passwordFocusNode);
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
                        onSave: (data) {
                          cubit.password = data;
                        },
                        keyBoardType: TextInputType.visiblePassword,
                        secure: true,
                        focusNode: cubit.passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        hintText: 'Password',
                        validator: (value) {
                          return Validator.validatePassword(value);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            AppRouter.navigateTo(const ForgetPasswordView());
                          },
                          child: const AppText(
                            text: 'Forgot your password? ',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03448,
                      ),
                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            return state is LoginLoading
                                ? const LoadingButton()
                                : AppButton(
                                    title: 'LOGIN',
                                    onTap: () {
                                      cubit.login();
                                    },
                                  );
                          }),
                      SizedBox(
                        height: height * .2339,
                      ),
                      // const Align(
                      //   alignment: Alignment.center,
                      //   child: AppText(
                      //     text: 'Or',
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      //  Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SocialMediaButton(imagePath: AppAssets.googleAsset),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     SocialMediaButton(
                      //       imagePath: AppAssets.faceBookAsset,
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
