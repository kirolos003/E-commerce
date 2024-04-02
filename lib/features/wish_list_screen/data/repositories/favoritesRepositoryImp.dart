import 'package:e_commerce/features/home_screen/data/data_sources/dataSourceContarcts/products_data_source_contract.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';
import 'package:e_commerce/features/wish_list_screen/data/data_sources/dataSourceContract/favorites_data_source_contract.dart';
import 'package:e_commerce/features/wish_list_screen/domain/repositories/favorites_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/constants.dart';

@Injectable(as : FavoritesRepository)
class FavoritesRepositoryImp extends FavoritesRepository{
  FavoritesDataSourceContract dataSource;

  @factoryMethod
  FavoritesRepositoryImp(this.dataSource);

  @override
  Future<List<Product>?> getFavorites({ProductSort? sortBy}) {
    return dataSource.getFavorites(
      token: token
    );
  } 
}