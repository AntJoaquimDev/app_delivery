import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailController extends Cubit<int> {
  late final bool _hasOrder;
  ProductDetailController() : super(1);

  void initial(int amount, bool hasOrder) {
    _hasOrder = hasOrder;
    emit(amount);
  }

  void incremente() => emit(state + 1);
  void decremente() {
    if (state > (_hasOrder ? 0 : 1)) {
      emit(state - 1);
    }
  }
}
