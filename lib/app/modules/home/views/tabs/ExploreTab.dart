import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekomarket/app/data/Models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../src/constants/ColorConstants.dart';
import '../../controllers/home_controller.dart';

class ExploreTab extends GetView<HomeController> {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() => controller.isInitializing.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  floating: true,
                  pinned: true,
                  title: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorConstants.gray600
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      onChanged: (value) {
                        controller.filteredCategories.value = controller
                            .tcategories
                            .where((item) => item.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        controller.filteredProducts.value = controller.tproducts
                            .where((item) => item.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          hintText: "Arama",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? ColorConstants.gray900
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Icon(
                                  IconlyLight.filter,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )),
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 16,
                  ),
                  _buildSection('Kategoriler', theme),
                  SizedBox(
                    height: 8,
                  ),
                  _buildCategories(theme),
                  SizedBox(
                    height: 16,
                  ),
                  _buildSection('Başlıca Ürünler', theme),
                  SizedBox(
                    height: 8,
                  ),
                  _buildDiscountedProducts(theme),
                ]),
              ),
            ],
          )));
  }

  Widget _buildCategory(CategoryModel category, index, theme) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/categoryproducts', arguments: category.id);
      },
      child: ZoomTapAnimation(
        beginDuration: Duration(milliseconds: 300),
        endDuration: Duration(milliseconds: 500),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.only(
              right:
                  controller.filteredCategories.length - 1 == index ? 7 : 15),
          child: Stack(
            children: [
              Container(
                width: 120,
                height: 60,
                child: CachedNetworkImage(
                  imageUrl: category.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(110),
                  ),
                  child: Center(
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 50,
            splashColor: theme.primaryColor.withAlpha(10),
            highlightColor: theme.primaryColor.withAlpha(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            child: Icon(
              IconlyLight.arrow_right,
              size: 20,
              color: theme.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategories(ThemeData theme) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: controller.filteredCategories.length,
        itemBuilder: (context, index) {
          return _buildCategory(
              controller.filteredCategories[index], index, theme);
        },
      ),
    );
  }

  Widget _buildDiscountedProducts(ThemeData theme) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütun olacak şekilde ayarlayabilirsiniz
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: controller.filteredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/product',
                  arguments: controller.filteredProducts[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Get.isDarkMode
                    ? ColorConstants.gray700
                    : Colors.grey.shade200,
                border: Border.all(
                  color: Get.isDarkMode
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: controller.filteredProducts[index].imageUrl!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.filteredProducts[index].name,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
