import 'package:get/get.dart';

import '../../../services/Networking/Providers/ProductProvider.dart';
import '../../../services/Networking/Repositories/ProductRepository.dart';
import '../controllers/categoryproducts_controller.dart';

class CategoryproductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryproductsController>(
      () => CategoryproductsController(),
    );
    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));
  }
}
