class CategoryMoc {
  final String id;
  final String name;
  final String icon;

  CategoryMoc({
    required this.id,
    required this.name,
    required this.icon,
  });
}

final List<CategoryMoc> mockCategories = [
  CategoryMoc(id: '1', name: 'هواتف', icon: '📱'),
  CategoryMoc(id: '2', name: 'لابتوبات', icon: '💻'),
  CategoryMoc(id: '3', name: 'سماعات', icon: '🎧'),
  CategoryMoc(id: '4', name: 'إكسسوارات', icon: '⌚'),
];
