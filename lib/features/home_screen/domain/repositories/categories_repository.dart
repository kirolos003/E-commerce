
import 'package:e_commerce/features/home_screen/domain/models/Category.dart';

abstract class CategoriesRepository {
  Future<List<Category>?> getCategories();
}