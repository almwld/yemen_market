import '../models/seller_model.dart';
import '../models/admin_product_model.dart';

class AdminService {
  final List<SellerModel> sellers = [];
  final List<AdminProduct> products = [];

  void approveSeller(String id) {
    final index = sellers.indexWhere((s) => s.id == id);
    if (index != -1) {
      sellers[index] = sellers[index].copyWith(approved: true);
    }
  }

  void approveProduct(String id) {
    final index = products.indexWhere((p) => p.id == id);
    if (index != -1) {
      products[index] = products[index].copyWith(approved: true);
    }
  }
}
