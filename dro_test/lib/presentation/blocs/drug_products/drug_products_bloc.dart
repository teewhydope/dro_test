import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dro_test/domain/entities/drug_products_entity.dart';
import 'package:dro_test/domain/entities/no_params.dart';
import 'package:dro_test/domain/usecases/drug_products.dart';
import 'package:equatable/equatable.dart';
part 'drug_products_event.dart';
part 'drug_products_state.dart';

class DrugProductsBloc extends Bloc<DrugProductsEvent, DrugProductsState> {
  final DrugProducts drugProducts;
  List<DrugProductsEntity> cartProducts = [];
  DrugProductsBloc({
    required this.drugProducts,
  }) : super(DrugProductsInitial());

  @override
  Stream<DrugProductsState> mapEventToState(
    DrugProductsEvent event,
  ) async* {
    if (event is AddToCart) {
      cartProducts.add(event.drugProduct);
    }

    if (event is AddingCartEvent) {
      yield AddingCartState(event.cartProducts);
    }

    if (event is DeleteFromCart) {
      cartProducts.remove(event.productId);
    }
    if (event is ClearCart) {
      cartProducts = [];
    }
    if (event is DrugProductsLoadEvent) {
      final drugProductsEither = await drugProducts(NoParams());
      yield drugProductsEither.fold(
        (l) => DrugProductsError(),
        (drugProducts) {
          return DrugProductsLoaded(
            drugProducts: drugProducts,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
