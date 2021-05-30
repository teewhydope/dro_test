import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class BuildHeader extends StatefulWidget {
  final DrugProductsBloc drugProductsBloc;

  BuildHeader(this.drugProductsBloc);

  @override
  _BuildHeaderState createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {
  @override
  Widget build(BuildContext context) {
    final drugProductsBloc = widget.drugProductsBloc;
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      color: AppColor.kDarkPurpleColor,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              height: MediaQuery.of(context).size.height * 0.007,
              width: MediaQuery.of(context).size.width * 0.12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/bag.svg',
                      color: AppColor.kwhiteColor,
                      height: ScreenUtil.screenHeight * 0.05,
                    ),
                    Text(
                      'Bag',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.dimen_10.h,
                      ),
                    ),
                  ],
                ),
                BlocListener<DrugProductsBloc, DrugProductsState>(
                  listener: (context, state) {},
                  child: CircleAvatar(
                    maxRadius: Sizes.dimen_16,
                    backgroundColor: Colors.white,
                    child: BlocBuilder<DrugProductsBloc, DrugProductsState>(
                      builder: (context, state) {
                        if (state is AddingCartState) {
                          drugProductsBloc.cartProducts.length =
                              state.cartProducts.length;
                        }
                        return Text(
                          widget.drugProductsBloc.cartProducts.length
                              .toString(),
                          style: TextStyle(
                            color: AppColor.kblackColor,
                            //fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
