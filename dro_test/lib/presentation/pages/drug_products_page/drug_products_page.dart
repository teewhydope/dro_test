import 'package:dro_test/di/get_it.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/body.dart';

class DrugProductsPage extends StatefulWidget {
  @override
  _DrugProductsPageState createState() => _DrugProductsPageState();
}

class _DrugProductsPageState extends State<DrugProductsPage> {
  late DrugProductsBloc drugProductsBloc;
  @override
  void initState() {
    super.initState();
    drugProductsBloc = getItInstance<DrugProductsBloc>();
    drugProductsBloc.add(DrugProductsLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    drugProductsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => drugProductsBloc,
      child: Scaffold(
        body: BodyBuilder(drugProductsBloc),
      ),
    );
  }
}
