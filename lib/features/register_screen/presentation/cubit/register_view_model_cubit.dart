import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/register_screen/domain/use_cases/RegisterUseCase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../domain/model/User.dart';
part 'register_view_model_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterViewModelState> {
  RegisterUseCase registerUseCase;


  @factoryMethod
  RegisterViewModel(this.registerUseCase) : super(RegisterViewModelInitial());

  void register({
    required String nameController,
    required String phoneController,
    required String emailController,
    required String passwordController,
    required String rePasswordController,
  }) async {
    emit(RegisterViewModelLoading());
    try {
      var user = await registerUseCase.invoke(nameController , phoneController, emailController, passwordController , rePasswordController);
      emit(RegisterViewModelSuccess(user));
    } catch (e) {
      emit(RegisterViewModelError(e.toString()));
    }
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changeSuffixVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangePasswordVisibility());
  }

}
