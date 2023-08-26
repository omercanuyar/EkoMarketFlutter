import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../home/views/tabs/FavoriteTab.dart';
import '../controllers/suggestion_controller.dart';

class SuggestionPage extends StatelessWidget {
  final SuggestionController controller = Get.put(SuggestionController());

  @override
  Widget build(BuildContext context) {
    // Simulated calculation on page load
    Future.delayed(Duration(seconds: 1), () {
      // Perform calculation here
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'En Uygun Market',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.withOpacity(1), // Sayfa arkaplanı
      body: Obx(
        () => AnimatedOpacity(
          opacity: controller.isLoading.value ? 0.0 : 1.0,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey
                      .withOpacity(0.2), // Arka planı beyaz yapmak için
                  child: ClipOval(
                    child: Image.network(
                      controller.marketImage,
                      fit: BoxFit.contain, // Resmi alanın içine sığdırmak için
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  controller.marketName,
                  style: TextStyle(
                    color: Colors.white, // Yazı rengini beyaz yapmak için
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  controller.marketAddress,
                  style: TextStyle(
                    color: Colors.white, // Yazı rengini beyaz yapmak için
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Distance: ${controller.marketDistance} km',
                  style: TextStyle(
                    color: Colors.white, // Yazı rengini beyaz yapmak için
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Cart Amount: ₺${controller.totalCartAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white, // Yazı rengini beyaz yapmak için
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Average Cart Amount: ₺${controller.averageCartAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white, // Yazı rengini beyaz yapmak için
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                RatingBar.builder(
                  initialRating: controller.rating.value.toDouble(),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    controller.rating.value = rating.toInt();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Turuncu renk
              ),
              onPressed: () {
                Get.toNamed('/home', arguments: 1);
              },
              child: Text('Haritada Göster'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Turuncu renk
              ),
              onPressed: () {
                controller.basketService.removeBasket();
                Get.offNamed('/home', arguments: 0);
              },
              child: Text('Alışverişi Bitir'),
            ),
          ],
        ),
      ),
    );
  }
}
