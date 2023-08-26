import 'package:ekomarket/app/data/Models/product_model.dart';

import '../Repositories/ProductRepository.dart';

class ProductProvider {
  final ProductRepository _productRepository;

  ProductProvider(this._productRepository);

  Future<List<Product>> getDiscountedProducts() async {
    var products = await _productRepository.getDiscountedProducts();

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getDiscountedProductsByCategory(int b) async {
    var products = await _productRepository.getDiscountedProducts();
    var a = products.map((product) => Product.fromJson(product)).toList();
    return a.where((element) => element.categoryId == b).toList();
  }

  // Future<Product> getProductById(int id) async {
  //   var product = await _productRepository.getProductId(id);

  //   return Product.fromJson(product);
  // }
}
