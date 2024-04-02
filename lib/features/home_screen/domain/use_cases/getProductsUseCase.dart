import 'package:e_commerce/features/home_screen/domain/models/Product.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  //Functional Requirement from the end user perspective
  // Such as when the user clicks on a button a certain action should happen
  // It is used to hide all the details from the presentation layer and it implements the business logic

  final ProductsRepository repository;

  @factoryMethod
  GetProductsUseCase(this.repository);

  Future<List<Product>?> invoke() {
    return repository.getProducts();
  }
}
