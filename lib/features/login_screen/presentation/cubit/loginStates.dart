import 'package:e_commerce/features/register_screen/domain/model/User.dart';
import 'package:flutter/material.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final User? user;

  LoginSuccess(this.user);
}

class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}

class ChangePasswordVisibility extends LoginStates {
  final bool isPassword;
  final IconData suffix;

  ChangePasswordVisibility(this.isPassword, this.suffix);
}


