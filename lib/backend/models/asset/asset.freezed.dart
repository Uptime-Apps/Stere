// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String? get id => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  bool get isAutomotive => throw _privateConstructorUsedError;
  double get mileage => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  AssetStatus get status => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryName =>
      throw _privateConstructorUsedError; // All of this are required but for testing they will be optional
  List<String>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {String? id,
      String? imagePath,
      bool isAutomotive,
      double mileage,
      String name,
      DateTime creationDate,
      num price,
      AssetStatus status,
      String categoryId,
      String categoryName,
      List<String>? tags});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imagePath = freezed,
    Object? isAutomotive = null,
    Object? mileage = null,
    Object? name = null,
    Object? creationDate = null,
    Object? price = null,
    Object? status = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutomotive: null == isAutomotive
          ? _value.isAutomotive
          : isAutomotive // ignore: cast_nullable_to_non_nullable
              as bool,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssetStatus,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$_AssetCopyWith(_$_Asset value, $Res Function(_$_Asset) then) =
      __$$_AssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? imagePath,
      bool isAutomotive,
      double mileage,
      String name,
      DateTime creationDate,
      num price,
      AssetStatus status,
      String categoryId,
      String categoryName,
      List<String>? tags});
}

/// @nodoc
class __$$_AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res, _$_Asset>
    implements _$$_AssetCopyWith<$Res> {
  __$$_AssetCopyWithImpl(_$_Asset _value, $Res Function(_$_Asset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imagePath = freezed,
    Object? isAutomotive = null,
    Object? mileage = null,
    Object? name = null,
    Object? creationDate = null,
    Object? price = null,
    Object? status = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? tags = freezed,
  }) {
    return _then(_$_Asset(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutomotive: null == isAutomotive
          ? _value.isAutomotive
          : isAutomotive // ignore: cast_nullable_to_non_nullable
              as bool,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssetStatus,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Asset implements _Asset {
  _$_Asset(
      {this.id,
      this.imagePath,
      this.isAutomotive = false,
      this.mileage = 0.0,
      required this.name,
      required this.creationDate,
      required this.price,
      required this.status,
      required this.categoryId,
      required this.categoryName,
      final List<String>? tags})
      : _tags = tags;

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  final String? id;
  @override
  final String? imagePath;
  @override
  @JsonKey()
  final bool isAutomotive;
  @override
  @JsonKey()
  final double mileage;
  @override
  final String name;
  @override
  final DateTime creationDate;
  @override
  final num price;
  @override
  final AssetStatus status;
  @override
  final String categoryId;
  @override
  final String categoryName;
// All of this are required but for testing they will be optional
  final List<String>? _tags;
// All of this are required but for testing they will be optional
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Asset(id: $id, imagePath: $imagePath, isAutomotive: $isAutomotive, mileage: $mileage, name: $name, creationDate: $creationDate, price: $price, status: $status, categoryId: $categoryId, categoryName: $categoryName, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isAutomotive, isAutomotive) ||
                other.isAutomotive == isAutomotive) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imagePath,
      isAutomotive,
      mileage,
      name,
      creationDate,
      price,
      status,
      categoryId,
      categoryName,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      __$$_AssetCopyWithImpl<_$_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  factory _Asset(
      {final String? id,
      final String? imagePath,
      final bool isAutomotive,
      final double mileage,
      required final String name,
      required final DateTime creationDate,
      required final num price,
      required final AssetStatus status,
      required final String categoryId,
      required final String categoryName,
      final List<String>? tags}) = _$_Asset;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  String? get id;
  @override
  String? get imagePath;
  @override
  bool get isAutomotive;
  @override
  double get mileage;
  @override
  String get name;
  @override
  DateTime get creationDate;
  @override
  num get price;
  @override
  AssetStatus get status;
  @override
  String get categoryId;
  @override
  String get categoryName;
  @override // All of this are required but for testing they will be optional
  List<String>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      throw _privateConstructorUsedError;
}
