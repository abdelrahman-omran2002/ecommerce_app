import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final updatedItems = List.of(state.items)..add(event.product);
    emit(state.copyWith(items: updatedItems));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .where((p) => p.id != event.productId)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }
}
