import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/screen_routes.dart';
import 'navigation_state.dart';

final navigationControllerProvider =
    StateNotifierProvider<NavigationController, NavigationState>(
        (ref) => NavigationController(
              NavigationState(currentRoute: '/', navItems: screenRoutes),
            ));

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController(super.state);

  void go(BuildContext context, String route) =>
      state = state.copyWith(currentRoute: route);

  @override
  void dispose() => super.dispose();
}
