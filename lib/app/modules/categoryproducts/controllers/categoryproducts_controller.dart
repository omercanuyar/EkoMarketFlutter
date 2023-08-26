import 'package:get/get.dart';

import '../../../data/Models/product_model.dart';
import '../../../services/Networking/Providers/ProductProvider.dart';

class CategoryproductsController extends GetxController {
  var tproducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  final RxBool isInitializing = true.obs;
  late int categoryId;
  final ProductProvider a = Get.find();

  Future getProductsById(int b) async {
    var products = await a.getDiscountedProductsByCategory(b);
    tproducts.value = products;
    filteredProducts.value = products;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    categoryId = Get.arguments as int;
    await getProductsById(categoryId);
    isInitializing.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
