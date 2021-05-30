import 'package:dro_test/data/core/ApiClients/drug_products_api_client.dart';
import 'package:dro_test/data/models/drug_products_model.dart';

abstract class DrugProductsRemoteDataSource {
  Future<List> getDrugProducts();
}

class DrugProductsRemoteDataSourceImpl extends DrugProductsRemoteDataSource {
  final DrugProductsClient _client;

  DrugProductsRemoteDataSourceImpl(
    this._client,
  );

  @override
  Future<List<DrugProductsModel>> getDrugProducts() async {
    final response = await _client.get('drugProducts.json');
    final drugProducts = welcomeFromJson(response).values.toList();
    //print(drugProducts);
    return drugProducts;
  }
}
