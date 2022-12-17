// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryDetailState {
  AsyncValue<Category> get category => throw _privateConstructorUsedError;
  AsyncValue<List<Asset>?> get assets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDetailStateCopyWith<CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailStateCopyWith<$Res> {
  factory $CategoryDetailStateCopyWith(
          CategoryDetailState value, $Res Function(CategoryDetailState) then) =
      _$CategoryDetailStateCopyWithImpl<$Res, CategoryDetailState>;
  @useResult
  $Res call({AsyncValue<Category> category, AsyncValue<List<Asset>?> assets});
}

/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res, $Val extends CategoryDetailState>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Category>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDetailStateCopyWith<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  factory _$$_CategoryDetailStateCopyWith(_$_CategoryDetailState value,
          $Res Function(_$_CategoryDetailState) then) =
      __$$_CategoryDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Category> category, AsyncValue<List<Asset>?> assets});
}

/// @nodoc
class __$$_CategoryDetailStateCopyWithImpl<$Res>
    extends _$CategoryDetailStateCopyWithImpl<$Res, _$_CategoryDetailState>
    implements _$$_CategoryDetailStateCopyWith<$Res> {
  __$$_CategoryDetailStateCopyWithImpl(_$_CategoryDetailState _value,
      $Res Function(_$_CategoryDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? assets = null,
  }) {
    return _then(_$_CategoryDetailState(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Category>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>?>,
    ));
  }
}

/// @nodoc

class _$_CategoryDetailState implements _CategoryDetailState {
  _$_CategoryDetailState({required this.category, required this.assets});

  @override
  final AsyncValue<Category> category;
  @override
  final AsyncValue<List<Asset>?> assets;

  @override
  String toString() {
    return 'CategoryDetailState(category: $category, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDetailState &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.assets, assets) || other.assets == assets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, assets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDetailStateCopyWith<_$_CategoryDetailState> get copyWith =>
      __$$_CategoryDetailStateCopyWithImpl<_$_CategoryDetailState>(
          this, _$identity);
}

abstract class _CategoryDetailState implements CategoryDetailState {
  factory _CategoryDetailState(
      {required final AsyncValue<Category> category,
      required final AsyncValue<List<Asset>?> assets}) = _$_CategoryDetailState;

  @override
  AsyncValue<Category> get category;
  @override
  AsyncValue<List<Asset>?> get assets;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDetailStateCopyWith<_$_CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
