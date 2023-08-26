import 'package:ekomarket/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FavoriteTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Yakınınızdaki Marketler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.orange,
            elevation: 0,
          ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.initialPosition,
              zoom: controller.zoom,
            ),
            markers: controller.markers,
          ),
        );
      },
    );
  }
}
