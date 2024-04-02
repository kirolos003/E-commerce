import 'package:e_commerce/features/register_screen/data/dataSourceContract/AuthenticationDataSource.dart';
import 'package:e_commerce/features/register_screen/domain/model/User.dart';
import 'package:e_commerce/features/register_screen/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImp extends AuthenticationRepository {
  AuthenticationDataSource dataSource;

  @factoryMethod
  AuthenticationRepositoryImp(this.dataSource);

  @override
  Future<User?> registerUser(String name, String phone, String email, String password , String rePassword) {
    return dataSource.registerUser(name, phone, email, password , rePassword);
  }

  @override
  Future<User?> loginUser(String email, String password) {
    return dataSource.loginUser(email, password);
  }
}