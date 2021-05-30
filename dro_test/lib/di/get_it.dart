import 'package:dro_test/data/core/ApiClients/drug_products_api_client.dart';
import 'package:dro_test/data/datasources/remote_data_source/drug_products_remote_data_source.dart';
import 'package:dro_test/data/repositories/drug_products_repository_impl.dart';
import 'package:dro_test/domain/repositories/drug_products_repository.dart';
import 'package:dro_test/domain/usecases/drug_products.dart';
import 'package:dro_test/presentation/blocs/drug_products/drug_products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Http Client
  getItInstance.registerLazySingleton<Client>(() => Client());

  /***** Api Clients *****/

  //DrugProductsClient
  getItInstance.registerLazySingleton<DrugProductsClient>(
      () => DrugProductsClient(getItInstance()));

  /***** Data Sources *****/

  //DrugProductsRemoteDataSource
  getItInstance.registerLazySingleton<DrugProductsRemoteDataSource>(
      () => DrugProductsRemoteDataSourceImpl(getItInstance()));

  /***** Repositories *****/

  //DrugProductRepository
  getItInstance.registerLazySingleton<DrugProductRepository>(() =>
      DrugProductRepositoryImpl(drugProductsRemoteDataSource: getItInstance()));

  /***** Usecases *****/

  //DrugProducts
  getItInstance
      .registerLazySingleton<DrugProducts>(() => DrugProducts(getItInstance()));

  /***** Blocs/Cubits *****/

  //DrugProductsBloc

  getItInstance
      .registerFactory(() => DrugProductsBloc(drugProducts: getItInstance()));
}
