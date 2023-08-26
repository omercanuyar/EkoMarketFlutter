import '../../../data/Models/category_model.dart';
import '../Repositories/CategoryRepository.dart';

class CategoryProvider {
  final CategoryRepository _categoryRepository;

  CategoryProvider(this._categoryRepository);

  Future<List<CategoryModel>> getCategories() async {
    var categories = await _categoryRepository.getCategories();
    var a =
        categories.map((category) => CategoryModel.fromJson(category)).toList();
    return a;
  }
}
