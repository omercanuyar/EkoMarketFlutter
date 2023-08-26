import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/Models/product_model.dart';
import '../../controllers/home_controller.dart';

class CardTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sepetiniz',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Obx(() => GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.basketService.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                    controller.basketService.productList[i].product.name,
                    textAlign: TextAlign.center,
                  ),
                  trailing: buildQuantitySelector(
                      controller.basketService.productList[i].product),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    controller.basketService.productList[i].product.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
      floatingActionButton: SizedBox(
        width: 120,
        child: ElevatedButton(
          onPressed: () {
            if (controller.basketService.productList.length < 1) {
              Get.snackbar('Üzgünüm', 'Sepetinizde ürün bulunmamaktadır');
            } else {
              Get.offNamed('/suggestion');
            }
          },
          child: Text(
            'Hesapla',
            style: TextStyle(fontSize: 14),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            primary: Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget buildQuantitySelector(Product pro) {
    var _quantity = controller.basketService.productList
        .firstWhere((element) => element.product.id == pro.id)
        .quantity
        .obs;
    void _decreaseQuantity() {
      controller.basketService.decreaseQuantity(pro);
      _quantity--;
    }

    void _increaseQuantity() {
      controller.basketService.addToBasket(pro);
      _quantity++;
    }

    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _decreaseQuantity,
            ),
            Text(
              _quantity.toString(),
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _increaseQuantity,
            ),
          ],
        ));
  }
}
