// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rental_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RentalAsset _$RentalAssetFromJson(Map<String, dynamic> json) {
  return _RentalAsset.fromJson(json);
}

/// @nodoc
mixin _$RentalAsset {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentalAssetCopyWith<RentalAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalAssetCopyWith<$Res> {
  factory $RentalAssetCopyWith(
          RentalAsset value, $Res Function(RentalAsset) then) =
      _$RentalAssetCopyWithImpl<$Res, RentalAsset>;
  @useResult
  $Res call(
      {String id,
      String name,
      String categoryName,
      String categoryId,
      String? image});
}

/// @nodoc
class _$RentalAssetCopyWithImpl<$Res, $Val extends RentalAsset>
    implements $RentalAssetCopyWith<$Res> {
  _$RentalAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RentalAssetCopyWith<$Res>
    implements $RentalAssetCopyWith<$Res> {
  factory _$$_RentalAssetCopyWith(
          _$_RentalAsset value, $Res Function(_$_RentalAsset) then) =
      __$$_RentalAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String categoryName,
      String categoryId,
      String? image});
}

/// @nodoc
class __$$_RentalAssetCopyWithImpl<$Res>
    extends _$RentalAssetCopyWithImpl<$Res, _$_RentalAsset>
    implements _$$_RentalAssetCopyWith<$Res> {
  __$$_RentalAssetCopyWithImpl(
      _$_RentalAsset _value, $Res Function(_$_RentalAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? image = freezed,
  }) {
    return _then(_$_RentalAsset(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RentalAsset implements _RentalAsset {
  _$_RentalAsset(
      {required this.id,
      required this.name,
      required this.categoryName,
      required this.categoryId,
      this.image});

  factory _$_RentalAsset.fromJson(Map<String, dynamic> json) =>
      _$$_RentalAssetFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String categoryName;
  @override
  final String categoryId;
  @override
  final String? image;

  @override
  String toString() {
    return 'RentalAsset(id: $id, name: $name, categoryName: $categoryName, categoryId: $categoryId, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RentalAsset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, categoryName, categoryId, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RentalAssetCopyWith<_$_RentalAsset> get copyWith =>
      __$$_RentalAssetCopyWithImpl<_$_RentalAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RentalAssetToJson(
      this,
    );
  }
}

abstract class _RentalAsset implements RentalAsset {
  factory _RentalAsset(
      {required final String id,
      required final String name,
      required final String categoryName,
      required final String categoryId,
      final String? image}) = _$_RentalAsset;

  factory _RentalAsset.fromJson(Map<String, dynamic> json) =
      _$_RentalAsset.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get categoryName;
  @override
  String get categoryId;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_RentalAssetCopyWith<_$_RentalAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
