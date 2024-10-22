import 'dart:convert';
import 'dart:developer';

import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/firebase_controller.dart';
import '../controllers/permission_controller.dart';
import '../data/api/api_calls.dart';
import '../data/api/api_client.dart';
import '../data/repositories/auth_repo.dart';
import 'constants.dart';

class Init {
  getBaseUrl() async {
    ApiCalls calls = ApiCalls();
    await calls
        .apiCallWithResponseGet(
            'https://fishcary.com/fishcary/api/link2.php?for=true')
        .then((value) {
      log(value.toString());
      AppConstants().setBaseUrl = jsonDecode(value)['link'];
      log(AppConstants().getBaseUrl, name: 'BASE');
    });
  }

  initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);

    try {
      // Todo: ApiRepo
      Get.lazyPut(() => ApiClient(
          appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

      Get.lazyPut(
          () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

      // Todo: AuthController
      Get.lazyPut(() => AuthController(authRepo: Get.find()));
      Get.lazyPut(() => FirebaseController());
      Get.lazyPut(() => PermissionController());
    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }
}
