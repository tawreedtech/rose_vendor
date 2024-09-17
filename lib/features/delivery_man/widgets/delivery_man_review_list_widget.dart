import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_vendor/features/delivery_man/domain/model/delivery_man_review_model.dart';
import 'package:rose_vendor/features/delivery_man/domain/model/top_delivery_man.dart';
import 'package:rose_vendor/features/delivery_man/controllers/delivery_man_controller.dart';
import 'package:rose_vendor/common/basewidgets/no_data_screen.dart';
import 'package:rose_vendor/features/delivery_man/widgets/delivery_man_review_card_widget.dart';

class DeliveryManReviewListWidget extends StatelessWidget {
  final DeliveryMan? deliveryMan;
  const DeliveryManReviewListWidget({Key? key, this.deliveryMan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryManController>(
        builder: (context, review, _) {
          List<DeliveryManReview> reviewList = [];
          reviewList = review.deliveryManReviewList;
          return reviewList.isNotEmpty?
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviewList.length,
              itemBuilder: (context, index){
                return DeliveryManReviewCardWidget(reviewModel: reviewList[index]);
              }):const NoDataScreen();
        }
    );
  }
}
