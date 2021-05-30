import 'dart:io';

import 'package:dro_test/data/datasources/remote_data_source/drug_products_remote_data_source.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dro_test/domain/repositories/drug_products_repository.dart';

class DrugProductRepositoryImpl extends DrugProductRepository {
  final DrugProductsRemoteDataSource drugProductsRemoteDataSource;

  DrugProductRepositoryImpl({
    required this.drugProductsRemoteDataSource,
  });
  @override
  Future<Either<AppError, List<dynamic>>> getDrugProducts() async {
    try {
      final response = await drugProductsRemoteDataSource.getDrugProducts();
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }
}
