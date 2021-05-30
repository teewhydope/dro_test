import 'package:cached_network_image/cached_network_image.dart';
import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/pages/drug_details_page/components/drug_detail_argument.dart';
import 'package:dro_test/presentation/pages/drug_details_page/drug_detail_page.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class ProductsGridView extends StatefulWidget {
  final DrugProductsBloc drugProductsBloc;

  final List drugProducts;
  ProductsGridView(
    this.drugProducts,
    this.drugProductsBloc,
  );

  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 5,
          ),
          itemCount: widget.drugProducts.length,
          itemBuilder: (context, index) {
            final DrugProductsEntity drugProduct = widget.drugProducts[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DrugDetailPage(
                      drugDetailArguments: DrugDetailArguments(
                        drugId: index,
                        drugProductDetails: widget.drugProducts,
                        drugProductsBloc: widget.drugProductsBloc,
                      ),
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Sizes.dimen_8.h,
                  ),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView(
                    children: [
                      Container(
                        height: ScreenUtil.screenHeight * 0.2,
                        child: CachedNetworkImage(
                          imageUrl: drugProduct.imageUrl,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.screenHeight * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          drugProduct.title,
                          style: TextStyle(
                            fontSize: Sizes.dimen_8.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          drugProduct.description,
                          style: TextStyle(
                            fontSize: Sizes.dimen_6.h,
                            color: AppColor.kGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          drugProduct.mgQuantity,
                          style: TextStyle(
                            color: AppColor.kGreyColor,
                            fontSize: Sizes.dimen_6.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Chip(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.dimen_8.h,
                          ),
                          backgroundColor: AppColor.kGreyColor,
                          label: Text(
                            '₦${drugProduct.price.toString()}',
                            style: TextStyle(
                              color: AppColor.kwhiteColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: '',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
