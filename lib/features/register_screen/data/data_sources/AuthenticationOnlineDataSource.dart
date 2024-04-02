import 'package:e_commerce/features/home_screen/data/data_sources/remote/api_manager.dart';
import 'package:e_commerce/features/register_screen/data/dataSourceContract/AuthenticationDataSource.dart';
import 'package:e_commerce/features/register_screen/domain/model/User.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationOnlineDataSource extends AuthenticationDataSource{

  final ApiManager apiManager;

  @factoryMethod
  AuthenticationOnlineDataSource({required this.apiManager});

  @override
  Future<User?> registerUser(String name, String phone, String email, String password , String rePassword) async{
    var response = await apiManager.register(name, phone, email, password , rePassword);
    return response.toUser();
  }

  @override
  Future<User?> loginUser(String email, String password) async{
    var response = await apiManager.login(email, password);
    return response.toUser();
  }
}