

import 'package:rose_vendor/data/model/response/base/api_response.dart';
import 'package:rose_vendor/interface/repository_interface.dart';

abstract class NotificationRepositoryInterface implements RepositoryInterface{
  Future<ApiResponse> seenNotification(int id);
}