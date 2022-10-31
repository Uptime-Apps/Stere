import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/screen_routes.dart';
import '../l10n/generated/l10n.dart';
import '../views/authentication.dart';
import '../views/home.dart';
import 'navigation_item.dart';
import 'navigation_state.dart';

final navigationControllerProvider =
    StateNotifierProvider<NavigationController, NavigationState>(
  (ref) => NavigationController(
    NavigationState(
      currentRoute: '/',
      navItems: screenRoutes,
      navigationItems: [
        NavigationItem('assets',
            icon: Icons.now_widgets_rounded, label: S.current.lblAssets(2)),
        NavigationItem(HomeScreen.route,
            icon: Icons.home, label: S.current.lblHome),
        NavigationItem('rentals',
            icon: Icons.event_note_rounded, label: S.current.lblRentals(2)),
      ],
    ),
  ),
);

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController(super.state);

  void pushNamed(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
    state = state.copyWith(currentRoute: route);
  }

  void pushReplacement(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
    state = state.copyWith(currentRoute: route);
  }

  void setCurrentIndex(BuildContext context, int index) {
    state = state.copyWith(currentIndex: index);
    pushReplacement(context, state.navigationItems.elementAt(index).route);
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed(AuthGate.route);
  }

  @override
  void dispose() => super.dispose();
}
