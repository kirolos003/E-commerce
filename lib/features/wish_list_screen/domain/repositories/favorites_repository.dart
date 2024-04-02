import 'package:e_commerce/features/home_screen/domain/models/Product.dart';

abstract class FavoritesRepository {
  Future<List<Product>?> getFavorites();
}