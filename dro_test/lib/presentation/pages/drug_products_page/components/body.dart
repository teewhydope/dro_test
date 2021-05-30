import 'package:dro_test/common/screenutil/screenutil.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:dro_test/presentation/pages/drug_products_page/components/product_options.dart';
import 'package:dro_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'products_grid_view.dart';
import 'sheet_body_builder.dart';
import 'sheet_header_builder.dart';

class BodyBuilder extends StatefulWidget {
  final DrugProductsBloc drugProductsBloc;

  BodyBuilder(this.drugProductsBloc);

  @override
  _BodyBuilderState createState() => _BodyBuilderState();
}

class _BodyBuilderState extends State<BodyBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugProductsBloc, DrugProductsState>(
      bloc: widget.drugProductsBloc,
      builder: (context, state) {
        if (state is DrugProductsLoaded)
          return SafeArea(
            child: SlidingSheet(
              elevation: 8,
              cornerRadius: 30,
              color: AppColor.kDarkPurpleColor,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.4, 0.08, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      height: ScreenUtil.screenHeight * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            MdiIcons.arrowLeft,
                          ),
                          Text(
                            '${state.drugProducts.length.toString()} items(s)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                    ProductOptions(),
                    SizedBox(
                      height: ScreenUtil.screenHeight * 0.03,
                    ),
                    ProductsGridView(
                      state.drugProducts,
                      widget.drugProductsBloc,
                    ),
                  ],
                ),
              ),
              headerBuilder: (context, state) {
                return BuildHeader(widget.drugProductsBloc);
              },
              builder: (context, state) {
                return SheetBodyBuilder(
                  widget.drugProductsBloc,
                );
              },
            ),
          );
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColor.kDarkPurpleColor,
            ),
          ),
        );
      },
    );
  }
}
