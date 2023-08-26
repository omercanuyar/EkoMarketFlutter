import 'package:carousel_slider/carousel_controller.dart';
import 'package:ekomarket/app/data/Models/category_model.dart';
import 'package:ekomarket/app/data/Models/product_model.dart';
import 'package:ekomarket/app/services/basket_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../services/Networking/Providers/CategoryProvider.dart';
import '../../../services/Networking/Providers/ProductProvider.dart';
import '../views/tabs/CardTab.dart';
import '../views/tabs/ExploreTab.dart';
import '../views/tabs/FavoriteTab.dart';
import '../views/tabs/UserTab.dart';

class HomeController extends GetxController {
  final initialPage = Get.arguments as int?;
  late PageController pageController;
  late CarouselController carouselController;
  final CategoryProvider _categoryProvider = Get.find();
  final ProductProvider _productProvider = Get.find();
  final BasketService basketService = Get.find<BasketService>();
  final RxBool isInitializing = true.obs;
  var tproducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var tcategories = <CategoryModel>[].obs;
  var filteredCategories = <CategoryModel>[].obs;
  var currentPage = 0.obs;
  var currentBanner = 0.obs;
  double zoom = 16.0;
  LatLng initialPosition = const LatLng(40.976359, 28.740012);

  Set<Marker> markers = {};

  BitmapDescriptor? markerIcon;

  List<Widget> pages = [
    const ExploreTab(),
    FavoriteTab(),
    CardTab(),
    UserTab(),
  ];
  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void changeBanner(int index) {
    currentBanner.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    if (initialPage == null) {
      pageController = PageController(initialPage: 0);
    } else {
      zoom = 20;
      initialPosition = LatLng(40.976359, 28.740012);
      pageController = PageController(initialPage: initialPage!);
      changeBanner(initialPage!);
    }

    carouselController = CarouselController();
    await _setMarkerIcon();
    _setMarkers();
    await getCategories();
    await getDiscountedProducts();
    isInitializing.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future getCategories() async {
    var categories = await _categoryProvider.getCategories();
    tcategories.value = categories;
    filteredCategories.value = categories;
  }

  Future getDiscountedProducts() async {
    var products = await _productProvider.getDiscountedProducts();
    tproducts.value = products;
    filteredProducts.value = products;
  }

  void increment() => count.value++;

  Future _setMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(14, 14)),
        'assets/images/shopping-cart.png');
    update();
  }

  void _setMarkers() {
    // Marker konumlarını belirttik
    final locations = [
      LatLng(40.976359, 28.740012),
      LatLng(40.975322, 28.735527),
      LatLng(40.97913, 28.732438),
    ];

    locations.forEach((location) {
      markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          icon: markerIcon!,
        ),
      );
    });
    update();
  }
}
