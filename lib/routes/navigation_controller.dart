import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/screen_routes.dart';
import '../l10n/generated/l10n.dart';
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

  void go(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
    state = state.copyWith(currentRoute: route);
  }

  void setCurrentIndex(BuildContext context, int index) {
    state = state.copyWith(currentIndex: index);
    go(context, state.navigationItems.elementAt(index).route);
  }

  @override
  void dispose() => super.dispose();
}
