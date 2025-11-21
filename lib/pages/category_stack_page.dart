import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';

class CategoryStackPage extends StatefulWidget {
  final List<MenuModel> allMenus;

  const CategoryStackPage({super.key, required this.allMenus});

  @override
  State<CategoryStackPage> createState() => _CategoryStackPageState();
}

class _CategoryStackPageState extends State<CategoryStackPage> {
  String selectedCategory = "Makanan";

  @override
  Widget build(BuildContext context) {
    final filteredMenu = widget.allMenus
        .where((m) => m.category.toLowerCase() ==
            selectedCategory.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F6),
      appBar: AppBar(
        title: const Text("Kategori Menu"),
        backgroundColor: const Color(0xFFFFC8DD),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _categoryButton("Makanan"),
              _categoryButton("Minuman"),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: filteredMenu.length,
              itemBuilder: (context, i) {
                return MenuCard(menu: filteredMenu[i]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryButton(String label) {
    final active = selectedCategory == label;

    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: active ? Colors.pinkAccent : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pinkAccent),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
