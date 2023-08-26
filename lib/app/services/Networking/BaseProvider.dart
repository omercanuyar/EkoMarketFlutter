import 'package:get/get_connect.dart';

import '../../../src/constants/ApiConstants.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
  }
}
