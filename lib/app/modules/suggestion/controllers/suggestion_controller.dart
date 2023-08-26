import 'package:get/get.dart';

import '../../../services/basket_service.dart';

class SuggestionController extends GetxController {
  final BasketService basketService = Get.find<BasketService>();
  final String marketImage =
      'https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG';
  final String marketName = 'Denizköşkler Bim';
  final String marketAddress = 'Denizköşkler';
  final double marketDistance = 1.5;
  final double totalCartAmount = 412.5;
  final double averageCartAmount = 640;
  final RxBool isLoading = false.obs;
  final rating = 0.obs;
  //TODO: Implement SuggestionController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 4), () {
      isLoading.value = false;
    });
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
