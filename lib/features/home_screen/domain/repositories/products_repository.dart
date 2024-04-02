import 'package:e_commerce/features/home_screen/domain/models/Product.dart';

abstract class ProductsRepository {
  Future<List<Product>?> getProducts({
  ProductSort sortBy,
});
}

enum ProductSort{
  mostSelling("-sold"),
  lowestPrice("price"),
  highestPrice("-price");

  final String value;
  const ProductSort(this.value);

}