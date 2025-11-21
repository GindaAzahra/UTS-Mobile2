import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';
import '../blocs/order_cubit.dart';

class MenuCard extends StatelessWidget {
  final MenuModel menu;

  const MenuCard({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final discounted = menu.getDiscountedPrice();

    return Card(
      color: const Color(0xFFFFF0F6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (menu.discount > 0)
                  Text(
                    "Rp ${menu.price}",
                    style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                Text(
                  "Rp $discounted",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.pink,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              onPressed: () {
                context.read<OrderCubit>().addToOrder(menu);
              },
              child: const Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}
