import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';
import '../models/menu_model.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F6),
      appBar: AppBar(
        title: const Text("Ringkasan Pesanan"),
        backgroundColor: const Color(0xFFFFC8DD),
      ),
      body: BlocBuilder<OrderCubit, List<Map<String, dynamic>>>(
        builder: (context, items) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final MenuModel menu = items[index]["menu"];
                    final int qty = items[index]["qty"];

                    return ListTile(
                      title: Text(menu.name),
                      subtitle: Text("Qty: $qty | Harga: ${menu.getDiscountedPrice()}"),
                      trailing: Text("Rp ${menu.getDiscountedPrice() * qty}"),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Total: Rp ${context.read<OrderCubit>().getTotalPrice()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                onPressed: () {
                  context.read<OrderCubit>().clearOrder();
                },
                child: const Text("Checkout"),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
