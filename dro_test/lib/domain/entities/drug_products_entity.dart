import 'package:equatable/equatable.dart';

class DrugProductsEntity extends Equatable {
  final String description;
  final String imageUrl;
  final String mgQuantity;
  final int price;
  final String title;
  final String id;
  int quantity;

  DrugProductsEntity({
    required this.description,
    required this.imageUrl,
    required this.mgQuantity,
    required this.price,
    required this.title,
    required this.id,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        title,
        price,
        imageUrl,
        price,
        mgQuantity,
        id,
        quantity,
      ];
}
