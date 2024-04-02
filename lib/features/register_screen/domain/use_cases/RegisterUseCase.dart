import 'package:e_commerce/features/register_screen/domain/model/User.dart';
import 'package:e_commerce/features/register_screen/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthenticationRepository repository;

  @factoryMethod
  RegisterUseCase(this.repository);

  Future<User?> invoke(String name, String phone, String email, String password , String rePassword) {
    return repository.registerUser(name, phone, email, password , rePassword);
  }

}