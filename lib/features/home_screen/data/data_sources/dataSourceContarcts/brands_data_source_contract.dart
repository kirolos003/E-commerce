import '../../../domain/models/Brand.dart';

abstract class BrandsDataSourceContract {
  Future<List<Brand>?> getBrands();
}