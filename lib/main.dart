import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/order_cubit.dart';
import 'models/menu_model.dart';
import 'pages/order_home_page.dart';
import 'pages/order_summary_page.dart';
import 'pages/category_stack_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => OrderHomePage(),

          '/summary': (context) => const OrderSummaryPage(),

          '/category': (context) {
            final menus = ModalRoute.of(context)!.settings.arguments
                as List<MenuModel>;
            return CategoryStackPage(allMenus: menus);
          },
        },
      ),
    );
  }
}
