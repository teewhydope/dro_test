import 'package:dartz/dartz.dart';
import 'package:dro_test/domain/entities/app_error.dart';

abstract class DrugProductRepository {
  Future<Either<AppError, List<dynamic>>> getDrugProducts();
}
