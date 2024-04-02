import 'package:e_commerce/features/home_screen/domain/models/Category.dart';
import 'package:injectable/injectable.dart';
import '../dataSourceContarcts/categories_data_source_contract.dart';
import '../remote/api_manager.dart';

@Injectable(as: CategoriesDataSourceContract)
class CategoriesOnlineDataSourceImp extends CategoriesDataSourceContract {
  ApiManager apiManager;

  @factoryMethod
  CategoriesOnlineDataSourceImp(this.apiManager);

  @override
  Future<List<Category>?> getCategories() async {
    var response = await apiManager.getCategories();
    return response.data?.map((catDto) => catDto.toCategory()).toList();
  }


}


