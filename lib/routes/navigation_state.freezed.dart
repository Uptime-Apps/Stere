// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  List<String> get navItems => throw _privateConstructorUsedError;
  String get currentRoute => throw _privateConstructorUsedError;
  List<NavigationItem> get navigationItems =>
      throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {List<String> navItems,
      String currentRoute,
      List<NavigationItem> navigationItems,
      int currentIndex});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? currentRoute = null,
    Object? navigationItems = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      navItems: null == navItems
          ? _value.navItems
          : navItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
      navigationItems: null == navigationItems
          ? _value.navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$_NavigationStateCopyWith(
          _$_NavigationState value, $Res Function(_$_NavigationState) then) =
      __$$_NavigationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> navItems,
      String currentRoute,
      List<NavigationItem> navigationItems,
      int currentIndex});
}

/// @nodoc
class __$$_NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$_NavigationState>
    implements _$$_NavigationStateCopyWith<$Res> {
  __$$_NavigationStateCopyWithImpl(
      _$_NavigationState _value, $Res Function(_$_NavigationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? currentRoute = null,
    Object? navigationItems = null,
    Object? currentIndex = null,
  }) {
    return _then(_$_NavigationState(
      navItems: null == navItems
          ? _value._navItems
          : navItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
      navigationItems: null == navigationItems
          ? _value._navigationItems
          : navigationItems // ignore: cast_nullable_to_non_nullable
              as List<NavigationItem>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NavigationState implements _NavigationState {
  _$_NavigationState(
      {required final List<String> navItems,
      required this.currentRoute,
      required final List<NavigationItem> navigationItems,
      this.currentIndex = 1})
      : _navItems = navItems,
        _navigationItems = navigationItems;

  final List<String> _navItems;
  @override
  List<String> get navItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_navItems);
  }

  @override
  final String currentRoute;
  final List<NavigationItem> _navigationItems;
  @override
  List<NavigationItem> get navigationItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_navigationItems);
  }

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'NavigationState(navItems: $navItems, currentRoute: $currentRoute, navigationItems: $navigationItems, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationState &&
            const DeepCollectionEquality().equals(other._navItems, _navItems) &&
            (identical(other.currentRoute, currentRoute) ||
                other.currentRoute == currentRoute) &&
            const DeepCollectionEquality()
                .equals(other._navigationItems, _navigationItems) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_navItems),
      currentRoute,
      const DeepCollectionEquality().hash(_navigationItems),
      currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      __$$_NavigationStateCopyWithImpl<_$_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  factory _NavigationState(
      {required final List<String> navItems,
      required final String currentRoute,
      required final List<NavigationItem> navigationItems,
      final int currentIndex}) = _$_NavigationState;

  @override
  List<String> get navItems;
  @override
  String get currentRoute;
  @override
  List<NavigationItem> get navigationItems;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
