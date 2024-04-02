import 'package:e_commerce/features/register_screen/domain/model/User.dart';

abstract class AuthenticationRepository {
  Future<User?> registerUser(
      String name ,
      String phone ,
      String email,
      String password,
      String rePassword
      );

  Future<User?> loginUser(
      String email,
      String password
      );
}