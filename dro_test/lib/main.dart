import 'package:dartz/dartz.dart';
import 'package:dro_test/data/core/ApiClients/drug_products_api_client.dart';
import 'package:dro_test/data/datasources/remote_data_source/drug_products_remote_data_source.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/domain/usecases/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'common/screenutil/screenutil.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/no_params.dart';
import 'presentation/pages/drug_products_page/drug_products_page.dart';
import 'presentation/themes/theme_color.dart';
import 'presentation/themes/theme_text.dart';
import 'utils/utils.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  ScreenUtil.init();
  unawaited(SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ));
  DrugProducts drugProducts = getIt.getItInstance<DrugProducts>();
  final Either<AppError, List> eitherResponse = await drugProducts(NoParams());
  eitherResponse.fold(
    (l) {
      //print(l);
    },
    (r) {
      //print(r);
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          //TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(
            Color(
              AppColor.kPrimaryColor,
            ),
          ),
        ),
        primaryColor: AppColor.kwhiteColor,
        textTheme: ThemeText.getTextTheme(),
      ),
      home: DrugProductsPage(),
    );
  }
}
