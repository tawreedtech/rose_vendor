

import 'package:rose_vendor/data/model/response/base/api_response.dart';
import 'package:rose_vendor/interface/repository_interface.dart';

abstract class WalletRepositoryInterface implements RepositoryInterface{
  Future<ApiResponse> getDynamicWithDrawMethod();
  Future<ApiResponse> withdrawBalance(List <String?> typeKey, List<String> typeValue, int? id, String balance);

}