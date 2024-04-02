
import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';

abstract class ProductsDataSourceContract {
  Future<List<Product>?> getProducts({
  ProductSort? sortBy
});
}