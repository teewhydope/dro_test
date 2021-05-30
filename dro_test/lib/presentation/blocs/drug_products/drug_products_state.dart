part of 'drug_products_bloc.dart';

abstract class DrugProductsState extends Equatable {
  const DrugProductsState();

  @override
  List<Object> get props => [];
}

class DrugProductsInitial extends DrugProductsState {}

class DrugProductsError extends DrugProductsState {}

class AddingCartState extends DrugProductsState {
  final List<DrugProductsEntity> cartProducts;

  AddingCartState(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}

class DrugProductsLoaded extends DrugProductsState {
  final List<dynamic> drugProducts;
  final int defaultIndex;

  const DrugProductsLoaded({
    required this.drugProducts,
    required this.defaultIndex,
  });

  @override
  List<Object> get props => [drugProducts, defaultIndex];
}
