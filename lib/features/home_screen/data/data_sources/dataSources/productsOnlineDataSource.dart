import 'package:e_commerce/features/home_screen/data/data_sources/dataSourceContarcts/products_data_source_contract.dart';
import 'package:e_commerce/features/home_screen/data/data_sources/remote/api_manager.dart';
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as : ProductsDataSourceContract)
class ProductsOnlineDataSource extends ProductsDataSourceContract{
  ApiManager apiManager;

  @factoryMethod
  ProductsOnlineDataSource(this.apiManager);

  @override
  Future<List<Product>?> getProducts({ProductSort? sortBy}) async{
    var response = await apiManager.getProducts(sort: sortBy);
    return response.data?.map((catDto) => catDto.toProduct()).toList();
  }



}