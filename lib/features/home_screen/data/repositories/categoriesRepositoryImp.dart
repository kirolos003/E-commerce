import 'package:e_commerce/features/home_screen/domain/models/Category.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/categories_repository.dart';
import '../data_sources/dataSourceContarcts/categories_data_source_contract.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImp extends CategoriesRepository{
  CategoriesDataSourceContract dataSource;

  @factoryMethod
  CategoriesRepositoryImp(this.dataSource);

  @override
  Future<List<Category>?> getCategories() {
     return dataSource.getCategories();
  }
}