import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    required List<String> navItems,
    required String currentRoute,
  }) = _NavigationState;
}
