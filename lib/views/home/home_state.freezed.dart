// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  AsyncValue<Stream<List<Category>>>? get categories =>
      throw _privateConstructorUsedError;
  AsyncValue<Stream<List<Rental>>>? get activeRentals =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {AsyncValue<Stream<List<Category>>>? categories,
      AsyncValue<Stream<List<Rental>>>? activeRentals});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? activeRentals = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Category>>>?,
      activeRentals: freezed == activeRentals
          ? _value.activeRentals
          : activeRentals // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Rental>>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<Stream<List<Category>>>? categories,
      AsyncValue<Stream<List<Rental>>>? activeRentals});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? activeRentals = freezed,
  }) {
    return _then(_$_HomeState(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Category>>>?,
      activeRentals: freezed == activeRentals
          ? _value.activeRentals
          : activeRentals // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Rental>>>?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState({this.categories, this.activeRentals});

  @override
  final AsyncValue<Stream<List<Category>>>? categories;
  @override
  final AsyncValue<Stream<List<Rental>>>? activeRentals;

  @override
  String toString() {
    return 'HomeState(categories: $categories, activeRentals: $activeRentals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.activeRentals, activeRentals) ||
                other.activeRentals == activeRentals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories, activeRentals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final AsyncValue<Stream<List<Category>>>? categories,
      final AsyncValue<Stream<List<Rental>>>? activeRentals}) = _$_HomeState;

  @override
  AsyncValue<Stream<List<Category>>>? get categories;
  @override
  AsyncValue<Stream<List<Rental>>>? get activeRentals;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
