import 'package:get/get.dart';

import '../../../services/Networking/Providers/CategoryProvider.dart';
import '../../../services/Networking/Providers/ProductProvider.dart';
import '../../../services/Networking/Repositories/CategoryRepository.dart';
import '../../../services/Networking/Repositories/ProductRepository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryRepository>(() => CategoryRepository(Get.find()));
    Get.lazyPut<CategoryProvider>(() => CategoryProvider(Get.find()));

    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
