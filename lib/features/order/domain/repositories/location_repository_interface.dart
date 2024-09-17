

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rose_vendor/data/model/response/base/api_response.dart';
import 'package:rose_vendor/interface/repository_interface.dart';

abstract class LocationRepositoryInterface implements RepositoryInterface{
  Future<ApiResponse> getAddressFromGeocode(LatLng latLng);
  Future<ApiResponse> searchLocation(String text);
  Future<ApiResponse> getPlaceDetails(String? placeID);
}