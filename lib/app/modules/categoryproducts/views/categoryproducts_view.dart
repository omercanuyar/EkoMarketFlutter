import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../src/constants/ColorConstants.dart';
import '../controllers/categoryproducts_controller.dart';

class CategoryproductsView extends GetView<CategoryproductsController> {
  const CategoryproductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Obx(() => controller.isInitializing.value
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
                          controller.filteredProducts.value = controller
                              .tproducts
                              .where((item) => item.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            hintText: "Search",
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
                    _buildSection('Products', theme),
                    SizedBox(
                      height: 8,
                    ),
                    _buildDiscountedProducts(theme),
                  ]),
                ),
              ],
            ))),
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
