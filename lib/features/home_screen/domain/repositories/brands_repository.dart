import 'package:e_commerce/features/home_screen/domain/models/Brand.dart';

abstract class BrandsRepository {
  Future<List<Brand>?> getBrands();
}