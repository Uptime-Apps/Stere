// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryListState {
  AsyncValue<Stream<List<Category>>>? get categories =>
      throw _privateConstructorUsedError;
  AsyncValue<Stream<List<Asset>>>? get categoryAssets =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryListStateCopyWith<CategoryListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListStateCopyWith<$Res> {
  factory $CategoryListStateCopyWith(
          CategoryListState value, $Res Function(CategoryListState) then) =
      _$CategoryListStateCopyWithImpl<$Res, CategoryListState>;
  @useResult
  $Res call(
      {AsyncValue<Stream<List<Category>>>? categories,
      AsyncValue<Stream<List<Asset>>>? categoryAssets});
}

/// @nodoc
class _$CategoryListStateCopyWithImpl<$Res, $Val extends CategoryListState>
    implements $CategoryListStateCopyWith<$Res> {
  _$CategoryListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryAssets = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Category>>>?,
      categoryAssets: freezed == categoryAssets
          ? _value.categoryAssets
          : categoryAssets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Asset>>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryListStateCopyWith<$Res>
    implements $CategoryListStateCopyWith<$Res> {
  factory _$$_CategoryListStateCopyWith(_$_CategoryListState value,
          $Res Function(_$_CategoryListState) then) =
      __$$_CategoryListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<Stream<List<Category>>>? categories,
      AsyncValue<Stream<List<Asset>>>? categoryAssets});
}

/// @nodoc
class __$$_CategoryListStateCopyWithImpl<$Res>
    extends _$CategoryListStateCopyWithImpl<$Res, _$_CategoryListState>
    implements _$$_CategoryListStateCopyWith<$Res> {
  __$$_CategoryListStateCopyWithImpl(
      _$_CategoryListState _value, $Res Function(_$_CategoryListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryAssets = freezed,
  }) {
    return _then(_$_CategoryListState(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Category>>>?,
      categoryAssets: freezed == categoryAssets
          ? _value.categoryAssets
          : categoryAssets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Stream<List<Asset>>>?,
    ));
  }
}

/// @nodoc

class _$_CategoryListState implements _CategoryListState {
  _$_CategoryListState({this.categories, this.categoryAssets});

  @override
  final AsyncValue<Stream<List<Category>>>? categories;
  @override
  final AsyncValue<Stream<List<Asset>>>? categoryAssets;

  @override
  String toString() {
    return 'CategoryListState(categories: $categories, categoryAssets: $categoryAssets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryListState &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.categoryAssets, categoryAssets) ||
                other.categoryAssets == categoryAssets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories, categoryAssets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryListStateCopyWith<_$_CategoryListState> get copyWith =>
      __$$_CategoryListStateCopyWithImpl<_$_CategoryListState>(
          this, _$identity);
}

abstract class _CategoryListState implements CategoryListState {
  factory _CategoryListState(
          {final AsyncValue<Stream<List<Category>>>? categories,
          final AsyncValue<Stream<List<Asset>>>? categoryAssets}) =
      _$_CategoryListState;

  @override
  AsyncValue<Stream<List<Category>>>? get categories;
  @override
  AsyncValue<Stream<List<Asset>>>? get categoryAssets;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryListStateCopyWith<_$_CategoryListState> get copyWith =>
      throw _privateConstructorUsedError;
}
