// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'referral_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReferralType _$ReferralTypeFromJson(Map<String, dynamic> json) {
  return _ReferralType.fromJson(json);
}

/// @nodoc
mixin _$ReferralType {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralTypeCopyWith<ReferralType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralTypeCopyWith<$Res> {
  factory $ReferralTypeCopyWith(
          ReferralType value, $Res Function(ReferralType) then) =
      _$ReferralTypeCopyWithImpl<$Res, ReferralType>;
  @useResult
  $Res call({String? id, String name, String? description});
}

/// @nodoc
class _$ReferralTypeCopyWithImpl<$Res, $Val extends ReferralType>
    implements $ReferralTypeCopyWith<$Res> {
  _$ReferralTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReferralTypeCopyWith<$Res>
    implements $ReferralTypeCopyWith<$Res> {
  factory _$$_ReferralTypeCopyWith(
          _$_ReferralType value, $Res Function(_$_ReferralType) then) =
      __$$_ReferralTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, String? description});
}

/// @nodoc
class __$$_ReferralTypeCopyWithImpl<$Res>
    extends _$ReferralTypeCopyWithImpl<$Res, _$_ReferralType>
    implements _$$_ReferralTypeCopyWith<$Res> {
  __$$_ReferralTypeCopyWithImpl(
      _$_ReferralType _value, $Res Function(_$_ReferralType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$_ReferralType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferralType implements _ReferralType {
  _$_ReferralType({this.id, required this.name, this.description});

  factory _$_ReferralType.fromJson(Map<String, dynamic> json) =>
      _$$_ReferralTypeFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'ReferralType(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferralType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReferralTypeCopyWith<_$_ReferralType> get copyWith =>
      __$$_ReferralTypeCopyWithImpl<_$_ReferralType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferralTypeToJson(
      this,
    );
  }
}

abstract class _ReferralType implements ReferralType {
  factory _ReferralType(
      {final String? id,
      required final String name,
      final String? description}) = _$_ReferralType;

  factory _ReferralType.fromJson(Map<String, dynamic> json) =
      _$_ReferralType.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_ReferralTypeCopyWith<_$_ReferralType> get copyWith =>
      throw _privateConstructorUsedError;
}
