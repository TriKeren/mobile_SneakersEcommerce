import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_ecommerce/controllers/mainscreen_provider.dart';
import 'package:sneaker_ecommerce/views/shared/bottom_nav.dart';
import 'package:sneaker_ecommerce/views/ui/cartpage.dart';
import 'package:sneaker_ecommerce/views/ui/homepage.dart';
import 'package:sneaker_ecommerce/views/ui/profile.dart';
import 'package:sneaker_ecommerce/views/ui/searchpage.dart';
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pagelist = const [
    HomePage(),
    SearchPage(), 
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pagelist[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
