import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';

class DrugDetailArguments {
  final int drugId;
  final List drugProductDetails;
  final DrugProductsBloc drugProductsBloc;

  const DrugDetailArguments({
    required this.drugId,
    required this.drugProductDetails,
    required this.drugProductsBloc,
  });
}
