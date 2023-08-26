import '../../../Helpers/typedef.dart';
import '../ApiService.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  Future<List<JSON>> getDiscountedProducts() async {
    var products = [
      {
        "Id": 1,
        "Name": "Elma",
        "Explanation": "Taze ve sa\u011Fl\u0131kl\u0131 elma",
        "Imageurl":
            "https://images.pexels.com/photos/4065906/pexels-photo-4065906.jpeg?auto=compress\u0026cs=tinysrgb\u0026w=1600",
        "CategoryId": 1
      },
      {
        "Id": 2,
        "Name": "Domates",
        "Explanation": "Lezzetli ve do\u011Fal domates",
        "Imageurl":
            "https://images.pexels.com/photos/53588/tomatoes-vegetables-food-frisch-53588.jpeg?auto=compress\u0026cs=tinysrgb\u0026w=1600",
        "CategoryId": 1
      },
      {
        "Id": 3,
        "Name": "Torku 1 Lt S\u00FCt",
        "Explanation": "1 Lt Torku Taze s\u00FCt",
        "Imageurl":
            "https://z6c4t4d8.rocketcdn.me/wp-content/uploads/2020/10/torku.jpg",
        "CategoryId": 2
      },
      {
        "Id": 4,
        "Name": "G\u00FCres 30lu Yumurta",
        "Explanation": "Do\u011Fal ve taze yumurta",
        "Imageurl":
            "https://images.migrosone.com/sanalmarket/product/20000243/20000243-d205c4.jpg",
        "CategoryId": 2
      },
      {
        "Id": 5,
        "Name": "HasTavuk 1 KG Tavuk G\u00F6\u011Fs\u00FC",
        "Explanation": "Taze ve kaliteli tavuk g\u00F6\u011Fs\u00FC",
        "Imageurl":
            "https://st2.myideasoft.com/idea/gb/84/myassets/products/302/smh95732.png?revision=1600066352",
        "CategoryId": 3
      },
      {
        "Id": 6,
        "Name": "Dardanel Somon Bal\u0131\u011F\u0131",
        "Explanation":
            "Lezzetli ve sa\u011Fl\u0131kl\u0131 somon bal\u0131\u011F\u0131",
        "Imageurl":
            "https://productimages.hepsiburada.net/s/22/1500/9941197094962.jpg",
        "CategoryId": 3
      },
      {
        "Id": 7,
        "Name": "Somun Ekmek",
        "Explanation": "Geleneksel somun ekmek",
        "Imageurl":
            "https://supermarketkibris.com/uploads/images/category_somun-ekmek_63f10e92c867d.webp",
        "CategoryId": 4
      },
      {
        "Id": 8,
        "Name": "Tahinli \u00C7\u00F6rek",
        "Explanation": "Taze ve lezzetli tahinli \u00E7\u00F6rek",
        "Imageurl":
            "https://yagcioglupastaneleri.com/derindeneyim/uploads/tahinli-corek2.jpg",
        "CategoryId": 4
      },
      {
        "Id": 9,
        "Name": "Yayla Baldo Pirin\u00E7 1 KG",
        "Explanation": "Yayla Baldo Kaliteli pirin\u00E7",
        "Imageurl":
            "https://imgrosetta.mynet.com.tr/file/15289998/640xauto.jpg",
        "CategoryId": 5
      },
      {
        "Id": 10,
        "Name": "Tat Konserve Domates",
        "Explanation": "Lezzetli konserve domates",
        "Imageurl":
            "https://productimages.hepsiburada.net/s/26/1500/10140322988082.jpg",
        "CategoryId": 5
      }
    ];
    return products;
  }
}
