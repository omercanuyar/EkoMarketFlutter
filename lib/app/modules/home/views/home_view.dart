import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomAppBarItem(icon: IconlyLight.home, page: 0),
                    _bottomAppBarItem(icon: IconlyLight.bookmark, page: 1),
                    _bottomAppBarItem(icon: IconlyLight.buy, page: 2),
                    _bottomAppBarItem(icon: IconlyLight.profile, page: 3),
                  ],
                ),
              )),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [...controller.pages],
        ));
  }

  Widget _bottomAppBarItem({icon, page}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Icon(
        icon,
        color: controller.currentPage == page ? Colors.blue : Colors.grey,
        size: 22,
      ),
    );
  }
}
