import 'package:e_commerce/features/home_screen/domain/models/Brand.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  //Functional Requirement from the end user perspective
  // Such as when the user clicks on a button a certain action should happen
  // It is used to hide all the details from the presentation layer and it implements the business logic

  final BrandsRepository repository;

  @factoryMethod
  GetBrandsUseCase(this.repository);

  Future<List<Brand>?> invoke() {
    return repository.getBrands();
  }
}
