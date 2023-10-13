
// import 'package:be3ly/core/core/models/user/user.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../core/constants.dart';
// import '../../core/core/api_services/api_services.dart';
// import '../../core/core/app_storage/app_storage.dart';
// import '../../core/core/router/router.dart';
// import '../../core/widgets/snack_bar.dart';
// import '../nav_bar/view.dart';


// part 'state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   User? user;

//   final GlobalKey<FormState> formKey = GlobalKey();
//   String? email, password;

//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();

//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   static LoginCubit of(context) => BlocProvider.of(context);

//   Future<void> login() async {
//     formKey.currentState!.save();

//     if (formKey.currentState!.validate()) {
//       emit(LoginLoading());
//       try {
//         final response = await ApiService(Dio())
//             .post(data: {"email": email!, "password": password!}, url: 'login');
//         user = User.fromJson(response.data);
//         if (user!.status!) {
//           //showSnakBar(user!.message!, success);

//           await AppStorage.cacheUser(user!.data!.token!);
//           AppRouter.navigateAndPop(const NavBarView());
//         } else {
//           showSnackBar(
//               'This email doesn\'t match of any users try to Register and then try again',
//               error);
//         }
//       } catch (e) {
//         showSnackBar(user!.message!, error);
//       }

//       emit(LoginInitial());
//     } else {
//       autovalidateMode = AutovalidateMode.always;
//     }
//   }
// }
