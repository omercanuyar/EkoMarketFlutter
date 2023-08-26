import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/basket_controller.dart';

class BasketView extends GetView<BasketController> {
  const BasketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BasketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
