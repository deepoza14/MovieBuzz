import 'dart:developer';

import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  AuthRepo({required this.sharedPreferences, required this.apiClient});

  /// Methods to deal with Remote Data ///

  Future<Response> login({
    String? token,
  }) async =>
      await apiClient.postData(AppConstants.loginUri, {
        "token": token ?? '',
        "device_id": getDeviceId(),
      });

  Future<bool> saveUserNotificationTimeStamp(String timeStamp) async {
    return await sharedPreferences.setString(AppConstants.userNotificationTimeStamp, timeStamp);
  }

  String getUserNotificationTimeStamp() {
    return sharedPreferences.getString(AppConstants.userNotificationTimeStamp) ?? "";
  }

  Future<Response> signUp(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.signUpUri, data);

  Future<Response> emailVerification() async => await apiClient.postData(AppConstants.emailVerification, {});

  Future<Response> getProfileData() async => await apiClient.getData(AppConstants.profileUri);

  Future<Response> updateUserProfile(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.updateProfileUri, FormData(data));

  Future<Response> businessSettings() async => await apiClient.getData(AppConstants.businessSettings);

  Future<Response> getState() async => await apiClient.getData(AppConstants.stateUrl);

  Future<Response> getCity(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.cityUrl, data);

  // SHIPPING SECTIONS

  // FILTER SECTIONS

  // OTHER SECTIONS
  Future<Response> getExtras() async => await apiClient.getData(AppConstants.extras);

  Future<Response> getNotifications() async => await apiClient.getData(AppConstants.notification);

  Future<Response> deleteNotification({required List ids}) async => await apiClient.postData(AppConstants.deletenotification, {"ids": ids});

  /// Methods to deal with Remote Data ///

  /// Methods to deal with Local Data ///
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<bool> saveUserId(String id) async {
    log(getUserId());
    return await sharedPreferences.setString(AppConstants.userId, id);
  }

  String getUserId() {
    return sharedPreferences.getString(AppConstants.userId) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    sharedPreferences.remove(AppConstants.userId);
    apiClient.token = null;
    apiClient.updateHeader(null);
    return true;
  }

  String? getDeviceId() {
    var deviceSate = OneSignal.User.pushSubscription.id;
    log(deviceSate.toString(), name: "Device ID");
    return deviceSate;
  }

  /// Methods to deal with Local Data ///
}
