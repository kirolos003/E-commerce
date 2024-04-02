import 'package:e_commerce/features/home_screen/data/data_sources/remote/api_manager.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/models/Brand.dart';
import '../dataSourceContarcts/brands_data_source_contract.dart';

@Injectable(as: BrandsDataSourceContract)
class BrandsOnlineDataSource extends BrandsDataSourceContract {
  final ApiManager apiManager;

  @factoryMethod
  BrandsOnlineDataSource({required this.apiManager});

  @override
  Future<List<Brand>?> getBrands() async {
    var response = await apiManager.getBrands();
    return response.data?.map((brandDto) => brandDto.toBrand()).toList();
  }

}
