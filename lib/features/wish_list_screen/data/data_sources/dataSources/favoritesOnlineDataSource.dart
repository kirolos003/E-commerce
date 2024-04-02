import 'package:e_commerce/features/home_screen/data/data_sources/remote/api_manager.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/wish_list_screen/data/data_sources/dataSourceContract/favorites_data_source_contract.dart';
import 'package:injectable/injectable.dart';


@Injectable(as : FavoritesDataSourceContract)
class FavoritesOnlineDataSource extends FavoritesDataSourceContract{
  ApiManager apiManager;

  @factoryMethod
  FavoritesOnlineDataSource(this.apiManager);

  @override
  Future<List<Product>?> getFavorites({required String? token}) async{
    var response = await apiManager.getFavorites(token!);
    return response.data?.map((productDto) => productDto.toProduct()).toList();
  }

}