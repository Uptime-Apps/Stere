import 'package:freezed_annotation/freezed_annotation.dart';

import 'navigation_item.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    required List<NavigationItem> navigationItems,
    @Default(0) int currentIndex,
  }) = _NavigationState;
}
