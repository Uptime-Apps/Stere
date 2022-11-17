// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AssetListState {
  AsyncValue<Future<List<Asset>>>? get assets =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssetListStateCopyWith<AssetListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetListStateCopyWith<$Res> {
  factory $AssetListStateCopyWith(
          AssetListState value, $Res Function(AssetListState) then) =
      _$AssetListStateCopyWithImpl<$Res, AssetListState>;
  @useResult
  $Res call({AsyncValue<Future<List<Asset>>>? assets});
}

/// @nodoc
class _$AssetListStateCopyWithImpl<$Res, $Val extends AssetListState>
    implements $AssetListStateCopyWith<$Res> {
  _$AssetListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = freezed,
  }) {
    return _then(_value.copyWith(
      assets: freezed == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Future<List<Asset>>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetListStateCopyWith<$Res>
    implements $AssetListStateCopyWith<$Res> {
  factory _$$_AssetListStateCopyWith(
          _$_AssetListState value, $Res Function(_$_AssetListState) then) =
      __$$_AssetListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Future<List<Asset>>>? assets});
}

/// @nodoc
class __$$_AssetListStateCopyWithImpl<$Res>
    extends _$AssetListStateCopyWithImpl<$Res, _$_AssetListState>
    implements _$$_AssetListStateCopyWith<$Res> {
  __$$_AssetListStateCopyWithImpl(
      _$_AssetListState _value, $Res Function(_$_AssetListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = freezed,
  }) {
    return _then(_$_AssetListState(
      assets: freezed == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Future<List<Asset>>>?,
    ));
  }
}

/// @nodoc

class _$_AssetListState implements _AssetListState {
  _$_AssetListState({this.assets});

  @override
  final AsyncValue<Future<List<Asset>>>? assets;

  @override
  String toString() {
    return 'AssetListState(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetListState &&
            (identical(other.assets, assets) || other.assets == assets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetListStateCopyWith<_$_AssetListState> get copyWith =>
      __$$_AssetListStateCopyWithImpl<_$_AssetListState>(this, _$identity);
}

abstract class _AssetListState implements AssetListState {
  factory _AssetListState({final AsyncValue<Future<List<Asset>>>? assets}) =
      _$_AssetListState;

  @override
  AsyncValue<Future<List<Asset>>>? get assets;
  @override
  @JsonKey(ignore: true)
  _$$_AssetListStateCopyWith<_$_AssetListState> get copyWith =>
      throw _privateConstructorUsedError;
}
