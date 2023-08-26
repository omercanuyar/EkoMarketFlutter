import 'package:ekomarket/app/services/basket_service.dart';
import 'package:get/instance_manager.dart';

import 'app/services/Networking/ApiService.dart';
import 'app/services/Networking/BaseProvider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
    Get.put(BasketService(), permanent: true);
  }
}
