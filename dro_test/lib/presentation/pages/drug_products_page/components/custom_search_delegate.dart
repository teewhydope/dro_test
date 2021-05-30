import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<DrugProductsEntity> cartProducts = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppColor.kDarkPurpleColor,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColor.kwhiteColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.kDarkPurpleColor,
        elevation: 0,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [SizedBox.shrink()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Center(
        child: Icon(
          Icons.arrow_back,
          color: AppColor.kwhiteColor,
          size: Sizes.dimen_18.h,
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
