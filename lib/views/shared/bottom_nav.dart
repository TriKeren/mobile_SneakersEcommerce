import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_ecommerce/controllers/mainscreen_provider.dart';
import 'package:sneaker_ecommerce/views/shared/bottom_nav_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 0;
                },
                icon: mainScreenNotifier.pageIndex == 0
                    ? MdiIcons.home
                    : MdiIcons.homeOutline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex =1;
                },
                icon: Ionicons.search,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 2;
                },
                icon: mainScreenNotifier.pageIndex ==2
                    ? Ionicons.add
                    : Ionicons.add_circle_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 3;
                },
                icon: mainScreenNotifier.pageIndex ==3
                    ? Ionicons.cart
                    : Ionicons.cart_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 4;
                },
                icon: mainScreenNotifier.pageIndex ==4
                    ? Ionicons.person
                    : Ionicons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
      });
  }
}