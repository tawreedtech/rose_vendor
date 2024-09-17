import 'package:flutter/material.dart';
import 'package:rose_vendor/features/addProduct/domain/models/attr.dart';

class AttributeModel {
  Attr attribute;
  bool active;
  TextEditingController controller;
  List<String?> variants;

  AttributeModel({required this.attribute, required this.active, required this.controller, required this.variants});
}