import 'package:cached_network_image/cached_network_image.dart';
import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'components/custom_dialog.dart';
import 'components/drug_detail_argument.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class DrugDetailPage extends StatefulWidget {
  final DrugDetailArguments drugDetailArguments;

  DrugDetailPage({
    required this.drugDetailArguments,
  });
  @override
  _DrugDetailPageState createState() => _DrugDetailPageState();
}

class _DrugDetailPageState extends State<DrugDetailPage> {
  int min = 1;
  bool _itemSelected = false;
  @override
  Widget build(BuildContext context) {
    final DrugProductsEntity drugDetails = widget.drugDetailArguments
        .drugProductDetails[widget.drugDetailArguments.drugId];
    final drugProductsBloc = widget.drugDetailArguments.drugProductsBloc;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_6.h,
              vertical: Sizes.dimen_8.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: ScreenUtil.screenHeight * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(MdiIcons.arrowLeft),
                      ),
                      BlocListener<DrugProductsBloc, DrugProductsState>(
                        bloc: drugProductsBloc,
                        listener: (context, state) {},
                        child: BlocBuilder<DrugProductsBloc, DrugProductsState>(
                            bloc: drugProductsBloc,
                            builder: (context, state) {
                              if (state is AddingCartState) {
                                drugProductsBloc.cartProducts.length =
                                    state.cartProducts.length;
                              }
                              return Container(
                                height: ScreenUtil.screenHeight * 0.06,
                                width: ScreenUtil.screenWidth * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.dimen_6.h),
                                  color: AppColor.kDroPurpleColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svgs/bag.svg',
                                      color: AppColor.kwhiteColor,
                                      height: ScreenUtil.screenHeight * 0.04,
                                    ),
                                    SizedBox(
                                      width: ScreenUtil.screenWidth * 0.02,
                                    ),
                                    Text(
                                      drugProductsBloc.cartProducts.length
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.kwhiteColor,
                                        fontSize: Sizes.dimen_16,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil.screenHeight * 0.2,
                  child: CachedNetworkImage(
                    imageUrl: drugDetails.imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.defaultHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    drugDetails.title,
                    style: TextStyle(
                      fontSize: Sizes.dimen_20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    drugDetails.mgQuantity,
                    style: TextStyle(
                      fontSize: Sizes.dimen_16,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.defaultHeight * 0.02,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.kGreyColor,
                      radius: ScreenUtil.defaultHeight * 0.025,
                    ),
                    SizedBox(
                      width: ScreenUtil.defaultWidth * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SOLD BY',
                          style: TextStyle(
                            color: AppColor.kGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Emzor Pharmaceuticals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.dimen_12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil.defaultHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Sizes.dimen_4.h),
                      width: ScreenUtil.screenWidth * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_6.h),
                        border: Border.all(
                          color: AppColor.kGreyColor,
                          width: Sizes.dimen_1.h,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (drugDetails.quantity > min) {
                                setState(() {
                                  drugDetails.quantity--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                          Text(
                            drugDetails.quantity.toString(),
                            style: TextStyle(
                              fontSize: Sizes.dimen_18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                drugDetails.quantity++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₦${(drugDetails.quantity * drugDetails.price).toString()}',
                      style: TextStyle(
                        fontSize: Sizes.dimen_18,
                        fontWeight: FontWeight.bold,
                        fontFamily: '',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil.defaultHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PRODUCT DETAILS',
                    style: TextStyle(
                      color: AppColor.kGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.dimen_16,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.defaultHeight * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PACK SIZE',
                          style: TextStyle(
                            color: AppColor.kGreyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.dimen_14,
                          ),
                        ),
                        Text(
                          'PRODUCT ID',
                          style: TextStyle(
                            color: AppColor.kGreyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.dimen_14,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.defaultHeight * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CONSTITUENTS',
                        style: TextStyle(
                          color: AppColor.kGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.dimen_14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.defaultHeight * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DISPENSED IN',
                        style: TextStyle(
                          color: AppColor.kGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.dimen_14,
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenUtil.defaultHeight * 0.12,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            if (_itemSelected == false) {
                              DrugProductsEntity(
                                description: drugDetails.description,
                                imageUrl: drugDetails.imageUrl,
                                mgQuantity: drugDetails.mgQuantity,
                                price: drugDetails.price * drugDetails.quantity,
                                title: drugDetails.title,
                                id: drugDetails.id,
                                quantity: drugDetails.quantity,
                              );

                              drugProductsBloc.add(AddToCart(drugDetails));
                              showAnimatedDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: ScreenUtil.screenHeight * 0.45,
                                      width: ScreenUtil.screenWidth * 0.9,
                                      child: CustomDialogBox(
                                          drugDetails: drugDetails,
                                          drugProductsBloc: drugProductsBloc),
                                    ),
                                  );
                                },
                                animationType: DialogTransitionType.fade,
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 800),
                              );
                              setState(() {
                                _itemSelected = true;
                              });
                            } else
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  width: ScreenUtil.defaultWidth * 0.7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.dimen_32),
                                    ),
                                  ),
                                  content: Text(
                                    'Item already added to cart',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              );
                          },
                          child: Container(
                            height: 50,
                            width: ScreenUtil.screenWidth * 0.7,
                            decoration: BoxDecoration(
                                color: AppColor.kDroPurpleColor,
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_6.h)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/bag.svg',
                                  color: AppColor.kwhiteColor,
                                  height: ScreenUtil.screenHeight * 0.05,
                                ),
                                SizedBox(
                                  width: ScreenUtil.screenWidth * 0.02,
                                ),
                                Text(
                                  'Add to bag',
                                  style: TextStyle(
                                    color: AppColor.kwhiteColor,
                                    fontSize: Sizes.dimen_18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
