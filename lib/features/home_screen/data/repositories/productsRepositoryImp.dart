import 'package:e_commerce/features/home_screen/data/data_sources/dataSourceContarcts/products_data_source_contract.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository{
  ProductsDataSourceContract dataSource;

  @factoryMethod
  ProductsRepositoryImp(this.dataSource);

  @override
  Future<List<Product>?> getProducts({ProductSort? sortBy}) {
    return dataSource.getProducts(
      sortBy: sortBy
    );
  } 
}