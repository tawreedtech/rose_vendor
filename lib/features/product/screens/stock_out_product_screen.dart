import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_vendor/localization/language_constrants.dart';
import 'package:rose_vendor/features/product/controllers/product_controller.dart';
import 'package:rose_vendor/utill/dimensions.dart';
import 'package:rose_vendor/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_vendor/features/product/widgets/stock_out_product_widget.dart';

class StockOutProductScreen extends StatelessWidget {
  const StockOutProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBarWidget(title: getTranslated('stock_out_product',context)),
      body: RefreshIndicator(
        onRefresh: () async{
          Provider.of<ProductController>(context,listen: false).getStockOutProductList(1, 'en');
        },
        child: const Padding(
          padding: EdgeInsets.only(top: Dimensions.paddingSizeSmall),
          child: StockOutProductView(isHome: false),
        ),
      ),
    );
  }
}
