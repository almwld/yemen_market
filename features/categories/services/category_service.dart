import '../models/category_model.dart';

class CategoryService {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> get activeCategories =>
      _categories.where((c) => c.active).toList();

  List<CategoryModel> get all => _categories;

  void addCategory(CategoryModel category) {
    _categories.add(category);
  }

  void toggleCategory(String id) {
    final index = _categories.indexWhere((c) => c.id == id);
    if (index != -1) {
      _categories[index] =
          _categories[index].copyWith(active: !_categories[index].active);
    }
  }
}
