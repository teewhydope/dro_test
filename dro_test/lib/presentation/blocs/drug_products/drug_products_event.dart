part of 'drug_products_bloc.dart';

abstract class DrugProductsEvent extends Equatable {
  const DrugProductsEvent();

  @override
  List<Object> get props => [];
}

class DrugProductsLoadEvent extends DrugProductsEvent {
  final int defaultIndex;
  const DrugProductsLoadEvent({this.defaultIndex = 0});

  @override
  List<Object> get props => [defaultIndex];
}

class AddToCart extends DrugProductsEvent {
  final DrugProductsEntity drugProduct;
  AddToCart(this.drugProduct);

  @override
  List<Object> get props => [drugProduct];
}

class DeleteFromCart extends DrugProductsEvent {
  final DrugProductsEntity productId;
  DeleteFromCart(this.productId);
  @override
  List<Object> get props => [productId];
}

class ClearCart extends DrugProductsEvent {}

class AddingCartEvent extends DrugProductsEvent {
  final List<DrugProductsEntity> cartProducts;

  AddingCartEvent(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}
