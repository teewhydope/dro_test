import 'package:dartz/dartz.dart';
import 'package:dro_test/domain/entities/app_error.dart';
import 'package:dro_test/domain/entities/no_params.dart';
import 'package:dro_test/domain/repositories/drug_products_repository.dart';

import 'usecases.dart';

class DrugProducts extends UseCase<List<dynamic>, NoParams> {
  final DrugProductRepository drugProductRepository;

  DrugProducts(
    this.drugProductRepository,
  );

  @override
  Future<Either<AppError, List<dynamic>>> call(NoParams noParams) async {
    return await drugProductRepository.getDrugProducts();
  }
}
