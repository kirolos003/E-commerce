part of 'register_view_model_cubit.dart';

@immutable
abstract class RegisterViewModelState {}

class RegisterViewModelInitial extends RegisterViewModelState {}

class RegisterViewModelLoading extends RegisterViewModelState {}

class RegisterViewModelSuccess extends RegisterViewModelState {
  final User? user;

  RegisterViewModelSuccess(this.user);
}

class RegisterViewModelError extends RegisterViewModelState {
  final String error;

  RegisterViewModelError(this.error);
}

class ChangePasswordVisibility extends RegisterViewModelState {}




