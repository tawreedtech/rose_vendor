import 'package:flutter/material.dart';
import 'package:rose_vendor/localization/language_constrants.dart';
import 'package:rose_vendor/utill/color_resources.dart';
import 'package:rose_vendor/utill/dimensions.dart';
import 'package:rose_vendor/utill/styles.dart';
import 'package:rose_vendor/common/basewidgets/custom_button_widget.dart';
class MyDialogWidget extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final String? title;
  final String? description;
  const MyDialogWidget({Key? key, this.isFailed = false, this.rotateAngle = 0, required this.icon, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Stack(clipBehavior: Clip.none, children: [

          Positioned(
            left: 0, right: 0, top: -55,
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: isFailed ? ColorResources.getRed(context) : Theme.of(context).primaryColor, shape: BoxShape.circle),
              child: Transform.rotate(angle: rotateAngle, child: Icon(icon, size: 40, color: Colors.white)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(title!, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Text(description!, textAlign: TextAlign.center, style: titilliumRegular),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                child: CustomButtonWidget(btnTxt: getTranslated('ok', context), onTap: () => Navigator.pop(context)),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
