import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_search_delegate.dart';

class ProductOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(
            Sizes.dimen_6,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: SvgPicture.asset(
            'assets/svgs/filter2.svg',
            color: AppColor.cblackColor,
            width: 0,
            height: ScreenUtil.screenHeight * 0.03,
          ),
        ),
        SizedBox(
          width: ScreenUtil.screenWidth * 0.1,
        ),
        Container(
          padding: EdgeInsets.all(
            Sizes.dimen_6,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: SvgPicture.asset(
            'assets/svgs/filter.svg',
            color: AppColor.cblackColor,
            width: 0,
            height: ScreenUtil.screenHeight * 0.03,
          ),
        ),
        SizedBox(
          width: ScreenUtil.screenWidth * 0.1,
        ),
        GestureDetector(
          onTap: () {
            return;
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          child: Container(
            padding: EdgeInsets.all(
              Sizes.dimen_6,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: SvgPicture.asset(
              'assets/svgs/search.svg',
              color: AppColor.cblackColor,
              width: 0,
              height: ScreenUtil.screenHeight * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}
