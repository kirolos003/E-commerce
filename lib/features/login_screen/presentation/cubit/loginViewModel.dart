import 'package:e_commerce/features/login_screen/domain/use_cases/LoginUseCase.dart';
import 'package:e_commerce/features/login_screen/presentation/cubit/loginStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

 @injectable
class LoginViewModel extends Cubit<LoginStates> {
   LoginUseCase loginUseCase;
   @factoryMethod
   LoginViewModel(this.loginUseCase) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      var user = await loginUseCase.invoke(email , password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changeSuffixVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangePasswordVisibility(isPassword, suffix));
  }

}