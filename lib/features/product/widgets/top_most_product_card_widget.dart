import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rose_vendor/features/product/domain/models/product_model.dart';
import 'package:rose_vendor/localization/language_constrants.dart';
import 'package:rose_vendor/theme/controllers/theme_controller.dart';
import 'package:rose_vendor/utill/color_resources.dart';
import 'package:rose_vendor/utill/dimensions.dart';
import 'package:rose_vendor/utill/images.dart';
import 'package:rose_vendor/utill/styles.dart';
import 'package:rose_vendor/features/product_details/screens/product_details_screen.dart';

class TopMostProductWidget extends StatelessWidget {
  final Product? productModel;
  final bool isPopular;
  final String? totalSold;
  const TopMostProductWidget({Key? key, this.productModel, this.isPopular = false, this.totalSold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeExtraSmall,0,Dimensions.paddingSizeExtraSmall,Dimensions.paddingSizeExtraSmall),
      child: GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsScreen(productModel: productModel))),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
            boxShadow: [BoxShadow(color: Provider.of<ThemeController>(context, listen: false).darkTheme?Theme.of(context).primaryColor.withOpacity(0):
            Theme.of(context).primaryColor.withOpacity(.125), blurRadius: 1,spreadRadius: 1,offset: const Offset(1,2))]


          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: Container(decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.10),
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2-50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                  child: CachedNetworkImage(
                    placeholder: (ctx, url) => Image.asset(Images.placeholderImage,
                      height: Dimensions.imageSize,width: Dimensions.imageSize,fit: BoxFit.cover,),
                    fit: BoxFit.cover,
                    height: Dimensions.imageSize,width: Dimensions.imageSize,
                    errorWidget: (ctx,url,err) => Image.asset(Images.placeholderImage,fit: BoxFit.cover,
                     height: Dimensions.imageSize,width: Dimensions.imageSize,),
                     imageUrl: '${productModel!.thumbnailFullUrl?.path}'),
                ),
              ),
            ),


            Padding(padding: const EdgeInsets.fromLTRB( Dimensions.paddingSizeExtraSmall, 0,Dimensions.paddingSizeExtraSmall,Dimensions.paddingSizeExtraSmall,),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                  child: Center(
                    child: Text(productModel!.name!.trim(),textAlign: TextAlign.center, style: robotoMedium.copyWith(
                        color: ColorResources.titleColor(context),fontSize: Dimensions.fontSizeDefault),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                isPopular ?
                Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(NumberFormat.compact().format(productModel!.reviewsCount),
                      style: robotoMedium.copyWith(color: Theme.of(context).colorScheme.error, fontSize: Dimensions.fontSizeLarge),),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5, 0.0, 0.0),
                      child: SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.popularProductIcon)),
                    )
                  ],
                ):
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall, horizontal: Dimensions.paddingSizeSmall),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)
                    ),
                    child: Text('${NumberFormat.compact().format(double.parse(totalSold!))} ${getTranslated('sold', context)}',
                      style: robotoMedium.copyWith(color: Colors.white),),
                  ),
                )

              ],),
            ),
          ],),
        ),
      ),
    );
  }
}
