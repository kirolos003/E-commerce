import 'package:e_commerce/features/register_screen/domain/model/User.dart';
import 'package:e_commerce/features/register_screen/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthenticationRepository repository;

  @factoryMethod
  LoginUseCase(this.repository);

  Future<User?> invoke(String email, String password ) {
    return repository.loginUser( email, password);
  }

}