import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class OrderHomePage extends StatelessWidget {
  OrderHomePage({super.key});

  final List<MenuModel> menus = [
    MenuModel(id: "1", name: "Nasi Goreng", price: 15000, category: "Makanan", discount: 0.1),
    MenuModel(id: "2", name: "Ayam Geprek", price: 18000, category: "Makanan", discount: 0.15),
    MenuModel(id: "3", name: "Es Teh", price: 5000, category: "Minuman", discount: 0),
    MenuModel(id: "4", name: "Kopi Susu", price: 12000, category: "Minuman", discount: 0.05),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC8DD),
        title: const Text("Menu Warung Makan"),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () {
              Navigator.pushNamed(context, '/category', arguments: menus);
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
          ),
        ],
      ),

      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: menus.map((e) {
          return Container(
            margin: const EdgeInsets.all(6),
            child: Text(e.name),
          );
        }).toList(),
      ),
    );
  }
}
