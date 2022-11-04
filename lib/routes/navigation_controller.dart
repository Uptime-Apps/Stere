import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/icons.dart';
import '../l10n/generated/l10n.dart';
import '../views/assets/asset.dart';
import '../views/categories/category.dart';
import '../views/home/home.dart';
import '../views/rentals/rental.dart';
import 'navigation_item.dart';
import 'navigation_state.dart';

final navigationControllerProvider =
    StateNotifierProvider<NavigationController, NavigationState>(
  (ref) => NavigationController(
    NavigationState(
      navigationItems: [
        NavigationItem(const HomeScreen(),
            icon: icHome, label: S.current.lblHome),
        NavigationItem(const AssetScreen(),
            icon: icAssets, label: S.current.lblAssets(2)),
        NavigationItem(const RentalScreen(),
            icon: icRentals, label: S.current.lblRentals(2)),
        NavigationItem(const CategoryScreen(),
            icon: icCategories, label: S.current.lblCategories(2)),
      ],
    ),
  ),
);

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController(super.state);

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  bool viewIsHome() =>
      state.navigationItems[state.currentIndex].view is HomeScreen;

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() => super.dispose();
}
