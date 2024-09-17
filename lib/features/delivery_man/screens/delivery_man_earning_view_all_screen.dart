
import 'package:flutter/material.dart';
import 'package:rose_vendor/features/delivery_man/domain/model/top_delivery_man.dart';
import 'package:rose_vendor/localization/language_constrants.dart';
import 'package:rose_vendor/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_vendor/features/delivery_man/widgets/delivery_man_earning_list_view_widget.dart';



class DeliveryManEarningViewAllScreen extends StatefulWidget {
  final DeliveryMan? deliveryMan;
  const DeliveryManEarningViewAllScreen({Key? key, this.deliveryMan}) : super(key: key);

  @override
  State<DeliveryManEarningViewAllScreen> createState() => _DeliveryManEarningViewAllScreenState();
}

class _DeliveryManEarningViewAllScreenState extends State<DeliveryManEarningViewAllScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: getTranslated('earning_statement', context), isBackButtonExist: true),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: DeliverymanEarningListViewWidget(deliveryMan: widget.deliveryMan,  scrollController: _scrollController,)));
  }
}
