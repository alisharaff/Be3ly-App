import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';
import '../../../core/functions/validator/validator.dart';
import '../../core/widget/app_button.dart';
import '../../core/widget/app_text.dart';
import '../../core/widget/app_text_form_field.dart';
import 'cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Builder(builder: (context) {
        final cubit = ForgetPasswordCubit.of(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
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
              child: Form(
                key: cubit.formKey,
                autovalidateMode: cubit.autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Forgot password",
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * .1071,
                    ),
                    const AppText(
                        text:
                            'Please, enter your email address. You will receive a link to create a new password via email.'),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFormField(
                      onSave: (data) {
                        cubit.email = data;
                      },
                      textInputAction: TextInputAction.done,
                      hintText: 'Email',
                      validator: (value) {
                        return Validator.validateEmail(value);
                      },
                    ),
                    SizedBox(
                      height: height * .0862,
                    ),
                    AppButton(
                      title: 'SEND',
                      onTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.formKey.currentState!.save();
                        } else {
                          cubit.autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
