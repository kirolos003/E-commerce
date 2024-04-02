import 'dart:async';
import 'package:e_commerce/Network/cache_helper.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/dialog_util.dart';
import 'package:e_commerce/features/login_screen/presentation/cubit/loginStates.dart';
import 'package:e_commerce/features/login_screen/presentation/cubit/loginViewModel.dart';
import 'package:e_commerce/features/register_screen/presentation/pages/register_screen.dart';
import 'package:e_commerce/shared/shared_components.dart';
import 'package:e_commerce/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "kirolos11@gmail.com");
    TextEditingController passwordController = TextEditingController(text : "123456");
    var formKey = GlobalKey<FormState>();

    return BlocListener<LoginViewModel, LoginStates>(
      listenWhen: (previous, current) {
        if(current is LoginError){
          DialogUtil.showMessage(context, current.error,
              posActionTitle: 'Ok',
              posAction: (){
                Navigator.pop(context);
              }
          );
        }
        return true;
      },
      listener: (context, state) {
        switch(state){
          case LoginSuccess():
            DialogUtil.showMessage(context, 'Login Success ${state.user?.email}');
            CacheHelper.saveData(key: 'token', value: state.user?.token);
            Timer(const Duration(seconds: 1), () {
              Navigator.pop(context);
              navigateAndFinish(context, const MainScreen());
            });
          case ChangePasswordVisibility():
            setState(() {});
        }
      },
      bloc: viewModel,
      child: Scaffold(
        body : Container(
          width: double.infinity,
          color: const Color(0xff004182),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image : AssetImage('assets/icons/logo_login.png'),
                        width: 237,
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 86),
                  Text('Welcome Back To Route' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('Please sign in with your mail ' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Email' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    style: TextStyle(
                      color: const Color(0xb3000000),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        color: const Color(0xb3000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0), // Adjust border radius here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0), // Adjust border radius here
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0), // Adjust border radius here
                      ),
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Password' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    style: TextStyle(
                        color: const Color(0xb3000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                          color: const Color(0xb3000000),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          viewModel.changeSuffixVisibility();
                        },
                        icon: Icon( viewModel.suffix,),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    obscureText: viewModel.isPassword,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?' ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        viewModel.login(emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                    child: Text('Login' ,
                      style: TextStyle(
                          color: const Color(0xff004182),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?' ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          navigateTo(context , const RegisterScreen());
                        },
                        child: Text('Sign Up' ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
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
