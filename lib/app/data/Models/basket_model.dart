import 'package:ekomarket/app/data/Models/product_model.dart';

import 'market_model.dart';

class BasketObject {
  int productId;
  int quantity;

  BasketObject({
    required this.productId,
    required this.quantity,
  });

  factory BasketObject.fromJson(Map<String, dynamic> json) {
    return BasketObject(
      productId: json['ProductId'],
      quantity: json['Quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
    };
  }
}

class Basket {
  List<BasketObject> basketObjects;

  Basket({required this.basketObjects});

  factory Basket.fromJson(Map<String, dynamic> json) {
    List<dynamic> basketObjectsJson = json['BasketObjects'];
    List<BasketObject> basketObjects =
        basketObjectsJson.map((item) => BasketObject.fromJson(item)).toList();

    return Basket(
      basketObjects: basketObjects,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> basketObjectsJson =
        basketObjects.map((item) => item.toJson()).toList();

    return {
      'BasketObjects': basketObjectsJson,
    };
  }
}

class BasketResponse {
  Marketresponse market;
  double price;
  double avgPrice;

  BasketResponse({
    required this.market,
    required this.price,
    required this.avgPrice,
  });

  factory BasketResponse.fromJson(Map<String, dynamic> json) {
    return BasketResponse(
      market: Marketresponse.fromJson(json['Market']),
      price: json['Price'],
      avgPrice: json['AvgPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Market': market.toJson(),
      'Price': price,
      'AvgPrice': avgPrice,
    };
  }
}

class AppBasket {
  Product product;
  int quantity;

  AppBasket({
    required this.product,
    required this.quantity,
  });

  factory AppBasket.fromJson(Map<String, dynamic> json) {
    return AppBasket(
      product: Product.fromJson(json['Product']),
      quantity: json['Quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Product': product.toJson(),
      'Quantity': quantity,
    };
  }
}
