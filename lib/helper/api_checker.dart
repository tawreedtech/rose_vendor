import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_vendor/common/basewidgets/custom_snackbar_widget.dart';
import 'package:rose_vendor/data/model/response/base/api_response.dart';
import 'package:rose_vendor/main.dart';
import 'package:rose_vendor/features/auth/controllers/auth_controller.dart';
import 'package:rose_vendor/features/auth/screens/auth_screen.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if(apiResponse.error.toString() == 'Failed to load data - status code: 401') {
      Provider.of<AuthController>(Get.context!,listen: false).clearSharedData();
      Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);
    }else {
      String? errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      if (kDebugMode) {
        print(errorMessage);
      }
      if(errorMessage != ''){
        showCustomSnackBarWidget(errorMessage, Get.context!, sanckBarType: SnackBarType.error);
      }
    }
  }
}