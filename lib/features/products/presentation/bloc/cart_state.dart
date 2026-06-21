import '../../../products/data/models/product_model.dart';

class CartState {
  final List<ProductModel> items;

  const CartState({this.items = const []});

  CartState copyWith({List<ProductModel>? items}) {
    return CartState(items: items ?? this.items);
  }

  double get total => items.fold(0, (sum, item) => sum + item.price);
}