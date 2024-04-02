import '../../../domain/models/Category.dart';

abstract class CategoriesDataSourceContract {
  Future<List<Category>?> getCategories();
}