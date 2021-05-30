import 'dart:ui';
import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/pages/drug_products_page/components/sheet_body_builder.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;
  final DrugProductsEntity drugDetails;
  final DrugProductsBloc drugProductsBloc;

  const CustomDialogBox({
    this.title,
    this.descriptions,
    this.text,
    this.img,
    required this.drugDetails,
    required this.drugProductsBloc,
  });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.dimen_10,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: Sizes.dimen_10,
            //top: Sizes.dimen_20 + Sizes.dimen_10,
            right: Sizes.dimen_10,
            bottom: Sizes.dimen_10,
          ),
          margin: EdgeInsets.only(
            top: Sizes.dimen_20,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.dimen_8,
            ),
          ),
          child: ListView(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ' Successful',
                  style: TextStyle(
                    fontSize: Sizes.dimen_18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil.screenHeight * 0.02,
              ),
              Text(
                '${widget.drugDetails.title} has been added to your bag',
                style: TextStyle(
                  fontSize: Sizes.dimen_7.h,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenUtil.screenHeight * 0.03,
              ),
              Align(
                child: GestureDetector(
                  onTap: () {
                    return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: widget.drugProductsBloc,
                          child: Scaffold(
                            body: SlidingSheet(
                              elevation: 8,
                              cornerRadius: 30,
                              color: AppColor.kDarkPurpleColor,
                              snapSpec: const SnapSpec(
                                snap: true,
                                snappings: [0.4, 0.08, 1.0],
                                positioning:
                                    SnapPositioning.relativeToAvailableSpace,
                              ),
                              builder: (context, state) {
                                return SheetBodyBuilder(
                                  widget.drugProductsBloc,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: ScreenUtil.screenHeight * 0.07,
                    width: ScreenUtil.defaultWidth * 0.6,
                    decoration: BoxDecoration(
                      color: AppColor.kDroTurquoiseColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'View Bag',
                        style: TextStyle(
                          fontSize: Sizes.dimen_18,
                          color: AppColor.kwhiteColor,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil.screenHeight * 0.02,
              ),
              Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: ScreenUtil.screenHeight * 0.07,
                    width: ScreenUtil.defaultWidth * 0.6,
                    decoration: BoxDecoration(
                      color: AppColor.kDroTurquoiseColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: Sizes.dimen_18,
                          color: AppColor.kwhiteColor,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Sizes.dimen_10,
          right: Sizes.dimen_10,
          child: CircleAvatar(
            backgroundColor: AppColor.kDroTurquoiseColor,
            radius: Sizes.dimen_24,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Sizes.dimen_40,
                ),
              ),
              child: Icon(
                Icons.check,
                size: Sizes.dimen_32,
                color: AppColor.kwhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
