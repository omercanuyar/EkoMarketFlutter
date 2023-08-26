import 'package:ekomarket/app/data/Models/basket_model.dart';
import 'package:get/get.dart';

import '../data/Models/product_model.dart';

class BasketService extends GetxService {
  var productList = <AppBasket>[].obs;

  void addToBasket(Product basket) {
    if (productList.where((item) => item.product.id == basket.id).isNotEmpty) {
      productList.firstWhere((item) => item.product.id == basket.id).quantity++;
    } else {
      productList.add(AppBasket(product: basket, quantity: 1));
    }
  }

  void removeBasket() {
    productList.clear();
  }

  void decreaseQuantity(Product basket) {
    if (productList.where((item) => item.product.id == basket.id).isNotEmpty) {
      if (productList
              .firstWhere((element) => element.product.id == basket.id)
              .quantity ==
          1) {
        productList.remove(productList
            .firstWhere((element) => element.product.id == basket.id));
        Get.snackbar('Başarılı', 'Ürün sepetten kaldırıldı');
      } else {
        productList
            .firstWhere((element) => element.product.id == basket.id)
            .quantity--;
      }
    }
  }
}
