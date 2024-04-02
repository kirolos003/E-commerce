import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';

abstract class FavoritesDataSourceContract {
  Future<List<Product>?> getFavorites({
    required String? token,
});
}