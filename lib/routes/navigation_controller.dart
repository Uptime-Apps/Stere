import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/screen_routes.dart';
import '../l10n/generated/l10n.dart';
import '../views/authentication.dart';
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
            icon: Icons.now_widgets_rounded, label: S.current.lblAssets),
        NavigationItem('Home', icon: Icons.home, label: S.current.lblHome),
        NavigationItem('rentals',
            icon: Icons.event_note_rounded, label: S.current.lblRentals),
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

  Future<void> signOut(BuildContext context) async {
    Navigator.of(context).pushReplacementNamed(AuthGate.route);
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() => super.dispose();
}
