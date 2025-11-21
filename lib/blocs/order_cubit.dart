import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';

class OrderCubit extends Cubit<List<Map<String, dynamic>>> {
  OrderCubit() : super([]);

  void addToOrder(MenuModel menu) {
    final items = [...state];

    final index = items.indexWhere((e) => e["menu"].id == menu.id);

    if (index >= 0) {
      items[index]["qty"] += 1;
    } else {
      items.add({"menu": menu, "qty": 1});
    }

    emit(items);
  }

  void removeFromOrder(MenuModel menu) {
    final items = [...state];
    items.removeWhere((e) => e["menu"].id == menu.id);
    emit(items);
  }

  void updateQuantity(MenuModel menu, int qty) {
    final items = [...state];

    final index = items.indexWhere((e) => e["menu"].id == menu.id);

    if (index >= 0) {
      if (qty <= 0) {
        items.removeAt(index);
      } else {
        items[index]["qty"] = qty;
      }
      emit(items);
    }
  }

  int getTotalPrice() {
    int total = 0;

    for (var item in state) {
      final MenuModel menu = item["menu"];
      final int qty = item["qty"];
      total += menu.getDiscountedPrice() * qty;
    }

    return total;
  }

  void clearOrder() {
    emit([]);
  }
}
