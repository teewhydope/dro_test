import 'package:cached_network_image/cached_network_image.dart';
import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class SheetBodyBuilder extends StatefulWidget {
  final DrugProductsBloc drugProductsBloc;
  SheetBodyBuilder(this.drugProductsBloc);

  @override
  _SheetBodyBuilderState createState() => _SheetBodyBuilderState();
}

class _SheetBodyBuilderState extends State<SheetBodyBuilder> {
  int min = 1;
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    double initAmount = 0.0;
    final cartProduct = widget.drugProductsBloc.cartProducts;
    final drugProduct = widget.drugProductsBloc;
    cartProduct.forEach((element) {
      initAmount += element.price.toDouble() * element.quantity.toDouble();
      totalAmount = initAmount;
    });

    return Container(
      height: ScreenUtil.screenHeight * 1,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: ScreenUtil.screenWidth * 0.7,
              height: ScreenUtil.screenHeight * 0.05,
              decoration: BoxDecoration(
                color: AppColor.kwhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                child: Text(
                  'Tap on an item for add, remove, delete options',
                  style: TextStyle(
                    fontSize: Sizes.dimen_6.h,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.screenHeight * 0.04,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartProduct.length,
                itemBuilder: (context, index) {
                  final _drg = widget.drugProductsBloc.cartProducts[index];

                  return Column(
                    children: [
                      BlocBuilder<DrugProductsBloc, DrugProductsState>(
                          builder: (context, state) {
                        return ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                            hasIcon: false,
                          ),
                          collapsed: Text(''),
                          expanded: Container(
                            height: ScreenUtil.screenHeight * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    return setState(() {
                                      drugProduct.add(DeleteFromCart(_drg));
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/svgs/delete.svg',
                                    color: AppColor.kwhiteColor,
                                    height: ScreenUtil.screenHeight * 0.06,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (cartProduct[index].quantity > min) {
                                          setState(() {
                                            cartProduct[index].quantity--;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.kwhiteColor,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil.screenWidth * 0.02,
                                    ),
                                    Text(
                                      cartProduct[index].quantity.toString(),
                                      style: TextStyle(
                                        color: AppColor.kwhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil.screenWidth * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          cartProduct[index].quantity++;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.kwhiteColor,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil.screenWidth * 0.03,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          header: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: CachedNetworkImage(
                                          imageUrl: cartProduct[index].imageUrl,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil.screenWidth * 0.03,
                                      ),
                                      Text(
                                        'X${cartProduct[index].quantity.toString()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.kwhiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil.screenWidth * 0.08,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartProduct[index].title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.kwhiteColor,
                                            ),
                                          ),
                                          Text(
                                            cartProduct[index].description,
                                            style: TextStyle(
                                              color: AppColor.kwhiteColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '₦${(cartProduct[index].quantity * cartProduct[index].price).toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.kwhiteColor,
                                      fontFamily: '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: ScreenUtil.screenHeight * 0.03,
                      ),
                    ],
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: ScreenUtil.screenHeight * 0.28,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: TextStyle(
                          color: AppColor.kwhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.dimen_10.h,
                        ),
                      ),
                      cartProduct.length > 0
                          ? Text(
                              '₦${totalAmount.toString()}',
                              // '₦${cartProduct.reduce(
                              //       (val, element) => DrugProductsEntity(
                              //         description: val.description,
                              //         imageUrl: val.imageUrl,
                              //         mgQuantity: val.mgQuantity,
                              //         price: val.price + element.price,
                              //         title: val.title,
                              //         id: val.id,
                              //         quantity: val.quantity,
                              //       ),
                              //     ).price.toString()}',
                              style: TextStyle(
                                color: AppColor.kwhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.dimen_10.h,
                                fontFamily: '',
                              ),
                            )
                          : Text(
                              '₦0.0',
                              style: TextStyle(
                                color: AppColor.kwhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.dimen_10.h,
                                fontFamily: '',
                              ),
                            ),
                    ]),
                SizedBox(
                  height: ScreenUtil.screenHeight * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: ScreenUtil.screenWidth * 0.7,
                    height: ScreenUtil.screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: AppColor.kwhiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.dimen_10.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
