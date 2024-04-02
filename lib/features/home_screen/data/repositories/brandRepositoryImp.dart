import 'package:e_commerce/features/home_screen/data/data_sources/dataSourceContarcts/brands_data_source_contract.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/Brand.dart';
import '../../domain/repositories/brands_repository.dart';

@Injectable(as: BrandsRepository)
class BrandRepositoryImp extends BrandsRepository {
  BrandsDataSourceContract dataSource;

  @factoryMethod // Constructor Injection
  BrandRepositoryImp(this.dataSource);

  @override
  Future<List<Brand>?> getBrands() {
    return dataSource.getBrands();
  }
}