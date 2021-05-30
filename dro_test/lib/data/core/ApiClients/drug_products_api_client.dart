import 'dart:convert';

import 'package:http/http.dart';

import '../api_constants.dart';

class DrugProductsClient {
  final Client _client;
  DrugProductsClient(this._client);

  dynamic get(String path) async {
    final response = await _client
        .get(
          Uri.parse('${ApiConstants.BASE_URL}$path'),
        )
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      //print(response.body);
      return jsonDecode(jsonEncode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
