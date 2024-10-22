import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/models/contact_number.dart';

import '../data/models/response/response_model.dart';
import '../data/repositories/auth_repo.dart';
import '../services/constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;

  late final number = ContactNumber(number: '', countryCode: '+91');
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController alternateNumberController = TextEditingController();

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  String buildNumber = '1';
  String version = '1.0.0';

  bool drawercheck = false;

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    log(version, name: "Version:");
    log(buildNumber, name: "buildNumber:");
    update();
  }

  Future<ResponseModel> login({required String token}) async {
    ResponseModel responseModel;
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.loginUri}",
        name: "login");
    try {
      Response response = await authRepo.login(token: token);
      /*if(response.body.containsKey('errors')){
        return ResponseModel(false, response.statusText!,response.body['errors']);
      }*/
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log(response.bodyString!, name: "string_data");

        if (response.body.containsKey('errors')) {
          _isLoading = false;
          update();
          return ResponseModel(
              false, response.statusText!, response.body['errors']);
        }
        if (response.body.containsKey('token')) {
          authRepo.saveUserToken(response.body['token'].toString());
          log(authRepo.getUserToken(), name: "getUserToken");
        }

        update();
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(
          false,
          '${response.body['message']}',
        );
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++++++++++++ ${e.toString()} ++++++++++++++',
          name: "ERROR AT login()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  void setUserToken(String id) {
    authRepo.saveUserToken(id);
  }
}
