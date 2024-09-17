
import 'package:rose_vendor/data/model/response/base/api_response.dart';
import 'package:rose_vendor/interface/repository_interface.dart';

abstract class BarcodeRepositoryInterface implements RepositoryInterface{
  Future<ApiResponse> barCodeDownLoad(int? id, int quantity);
}