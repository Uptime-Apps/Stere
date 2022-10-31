import 'package:freezed_annotation/freezed_annotation.dart';

import 'navigation_item.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    required List<String> navItems,
    required String currentRoute,
    required List<NavigationItem> navigationItems,
    @Default(1) int currentIndex,
  }) = _NavigationState;
}
