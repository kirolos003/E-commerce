import 'dart:async';
import 'package:e_commerce/Network/cache_helper.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/dialog_util.dart';
import 'package:e_commerce/features/register_screen/presentation/cubit/register_view_model_cubit.dart';
import 'package:e_commerce/shared/shared_components.dart';
import 'package:e_commerce/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController(text: 'kirolos@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
  TextEditingController nameController = TextEditingController(text: 'kirolos');
  TextEditingController phoneController = TextEditingController(text: '01200087654');
  TextEditingController rePasswordController = TextEditingController(text: '123456');
  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();

    return BlocListener<RegisterViewModel, RegisterViewModelState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if(current is RegisterViewModelError){
          DialogUtil.showMessage(context, '${current.error}',
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
          case RegisterViewModelSuccess():
            DialogUtil.showMessage(context, 'User Registered Successfully ${state.user?.email}');
            CacheHelper.saveData(key: 'token', value: state.user?.token);
            Timer(const Duration(seconds: 3), () {
              Navigator.pop(context);
              navigateAndFinish(context, const MainScreen());
            });
          case ChangePasswordVisibility():
            setState(() {});
        }
      },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            color: const Color(0xff004182),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(height: 46.h),
                        Text(
                          'Full Name',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xb3000000),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                                color: Color(0xb3000000),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          controller: nameController,
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xb3000000),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Color(0xb3000000),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone Number must not be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          'E-mail address',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xb3000000),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'E-mail',
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'E-mail Address must not be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xb3000000),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
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
                              icon: Icon(viewModel.suffix),
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
                        SizedBox(height: 24.h),
                        Text(
                            'Retype Password',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xb3000000),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Retype Password',
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
                              icon: Icon(viewModel.suffix),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'rePassword must not be empty';
                            }
                            return null;
                          },
                          obscureText: viewModel.isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          controller: rePasswordController,
                        ),
                        SizedBox(height: 56.h),
                        ElevatedButton(
                          onPressed: () {
                               if (formKey.currentState!.validate()) {
                                 if(passwordController.text == rePasswordController.text){
                                   viewModel.register(
                                       emailController: emailController.text,
                                       passwordController: passwordController.text,
                                       nameController: nameController.text,
                                       phoneController: phoneController.text,
                                       rePasswordController: rePasswordController.text
                                   );
                                 }
                                }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(double.infinity, 50.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: const Text('Register' ,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff004182)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

    );

  }
}
