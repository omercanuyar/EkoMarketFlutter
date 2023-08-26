import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final controller = LiquidController();

  RxInt currentPage = 0.obs;

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() async {
    if (currentPage.value == 2) {
      await Future.delayed(const Duration(milliseconds: 2000));
      Get.toNamed('/home');
    } else {
      int nextPage = controller.currentPage + 1;
      controller.animateToPage(page: nextPage);
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
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
