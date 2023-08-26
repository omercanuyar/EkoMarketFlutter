import '../../../Helpers/typedef.dart';
import '../ApiService.dart';

class CategoryRepository {
  final ApiService _apiService;

  CategoryRepository(this._apiService);

  Future<List<JSON>> getCategories() async {
    var categories = [
      {
        "id": 1,
        "name": "Meyve ve Sebzeler",
        "imageurl":
            "https://www.eskitadinda.com/img/saglikli_yasam/2/organik-meyve-sebzelerin-farki-nedir_262_2.jpg",
      },
      {
        "id": 2,
        "name": "Süt Ürünleri ve Yumurtalar",
        "imageurl":
            "https://static.daktilo.com/sites/1191/uploads/2016/08/17/large/63512-0.jpg"
      },
      {
        "id": 3,
        "name": "Et ve Balık Ürünleri",
        "imageurl":
            "https://www.acibadem.com.tr/hayat/Images/YayinMakaleler/kirmizi-et-balik-ve-beyaz-et-secme-tuyolari_1693_1.jpg"
      },
      {
        "id": 4,
        "name": "Unlu Mamuller ve Ekmek",
        "imageurl":
            "https://magazinebbm.com/assets/img/uploads/2014/12/dosya.png"
      },
      {
        "id": 5,
        "name": "Temel Gıda",
        "imageurl":
            "https://www.cevrecienerji.org/wp-content/uploads/2019/07/temelgida-640x428.jpg"
      }
    ];
    return categories;
  }
}
