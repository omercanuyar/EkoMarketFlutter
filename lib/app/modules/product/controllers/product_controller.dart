import 'package:get/get.dart';

import '../../../data/Models/product_model.dart';
import '../../../services/basket_service.dart';

class ProductController extends GetxController {
  late Product product;
  final BasketService basketService = Get.find<BasketService>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    product = product = Get.arguments as Product;
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
