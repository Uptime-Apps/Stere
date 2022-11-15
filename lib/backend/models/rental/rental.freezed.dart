// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rental.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rental _$RentalFromJson(Map<String, dynamic> json) {
  return _Rental.fromJson(json);
}

/// @nodoc
mixin _$Rental {
//Rental Metadata
  String? get id => throw _privateConstructorUsedError;
  String? get referralType => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  RentalStatus get status =>
      throw _privateConstructorUsedError; //Employee Details
  String? get employeeName => throw _privateConstructorUsedError;
  String? get employeePhoto => throw _privateConstructorUsedError;
  String get employeeEmail => throw _privateConstructorUsedError;
  String get employeeId =>
      throw _privateConstructorUsedError; //Rental Information
  List<RentalAsset> get assets =>
      throw _privateConstructorUsedError; //Client Details
  String get clientDeposit => throw _privateConstructorUsedError;
  String get clientEmail => throw _privateConstructorUsedError;
  String get clientHousing => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientPhone => throw _privateConstructorUsedError;
  String? get backupPhone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentalCopyWith<Rental> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalCopyWith<$Res> {
  factory $RentalCopyWith(Rental value, $Res Function(Rental) then) =
      _$RentalCopyWithImpl<$Res, Rental>;
  @useResult
  $Res call(
      {String? id,
      String? referralType,
      DateTime creationDate,
      RentalStatus status,
      String? employeeName,
      String? employeePhoto,
      String employeeEmail,
      String employeeId,
      List<RentalAsset> assets,
      String clientDeposit,
      String clientEmail,
      String clientHousing,
      String clientId,
      String clientName,
      String clientPhone,
      String? backupPhone});
}

/// @nodoc
class _$RentalCopyWithImpl<$Res, $Val extends Rental>
    implements $RentalCopyWith<$Res> {
  _$RentalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referralType = freezed,
    Object? creationDate = null,
    Object? status = null,
    Object? employeeName = freezed,
    Object? employeePhoto = freezed,
    Object? employeeEmail = null,
    Object? employeeId = null,
    Object? assets = null,
    Object? clientDeposit = null,
    Object? clientEmail = null,
    Object? clientHousing = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? backupPhone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referralType: freezed == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEmail: null == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: null == clientEmail
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      clientHousing: null == clientHousing
          ? _value.clientHousing
          : clientHousing // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RentalCopyWith<$Res> implements $RentalCopyWith<$Res> {
  factory _$$_RentalCopyWith(_$_Rental value, $Res Function(_$_Rental) then) =
      __$$_RentalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? referralType,
      DateTime creationDate,
      RentalStatus status,
      String? employeeName,
      String? employeePhoto,
      String employeeEmail,
      String employeeId,
      List<RentalAsset> assets,
      String clientDeposit,
      String clientEmail,
      String clientHousing,
      String clientId,
      String clientName,
      String clientPhone,
      String? backupPhone});
}

/// @nodoc
class __$$_RentalCopyWithImpl<$Res>
    extends _$RentalCopyWithImpl<$Res, _$_Rental>
    implements _$$_RentalCopyWith<$Res> {
  __$$_RentalCopyWithImpl(_$_Rental _value, $Res Function(_$_Rental) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referralType = freezed,
    Object? creationDate = null,
    Object? status = null,
    Object? employeeName = freezed,
    Object? employeePhoto = freezed,
    Object? employeeEmail = null,
    Object? employeeId = null,
    Object? assets = null,
    Object? clientDeposit = null,
    Object? clientEmail = null,
    Object? clientHousing = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? backupPhone = freezed,
  }) {
    return _then(_$_Rental(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referralType: freezed == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEmail: null == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: null == clientEmail
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      clientHousing: null == clientHousing
          ? _value.clientHousing
          : clientHousing // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rental implements _Rental {
  _$_Rental(
      {this.id,
      this.referralType,
      required this.creationDate,
      required this.status,
      this.employeeName,
      this.employeePhoto,
      required this.employeeEmail,
      required this.employeeId,
      required final List<RentalAsset> assets,
      required this.clientDeposit,
      required this.clientEmail,
      required this.clientHousing,
      required this.clientId,
      required this.clientName,
      required this.clientPhone,
      this.backupPhone})
      : _assets = assets;

  factory _$_Rental.fromJson(Map<String, dynamic> json) =>
      _$$_RentalFromJson(json);

//Rental Metadata
  @override
  final String? id;
  @override
  final String? referralType;
  @override
  final DateTime creationDate;
  @override
  final RentalStatus status;
//Employee Details
  @override
  final String? employeeName;
  @override
  final String? employeePhoto;
  @override
  final String employeeEmail;
  @override
  final String employeeId;
//Rental Information
  final List<RentalAsset> _assets;
//Rental Information
  @override
  List<RentalAsset> get assets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

//Client Details
  @override
  final String clientDeposit;
  @override
  final String clientEmail;
  @override
  final String clientHousing;
  @override
  final String clientId;
  @override
  final String clientName;
  @override
  final String clientPhone;
  @override
  final String? backupPhone;

  @override
  String toString() {
    return 'Rental(id: $id, referralType: $referralType, creationDate: $creationDate, status: $status, employeeName: $employeeName, employeePhoto: $employeePhoto, employeeEmail: $employeeEmail, employeeId: $employeeId, assets: $assets, clientDeposit: $clientDeposit, clientEmail: $clientEmail, clientHousing: $clientHousing, clientId: $clientId, clientName: $clientName, clientPhone: $clientPhone, backupPhone: $backupPhone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rental &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referralType, referralType) ||
                other.referralType == referralType) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeePhoto, employeePhoto) ||
                other.employeePhoto == employeePhoto) &&
            (identical(other.employeeEmail, employeeEmail) ||
                other.employeeEmail == employeeEmail) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.clientDeposit, clientDeposit) ||
                other.clientDeposit == clientDeposit) &&
            (identical(other.clientEmail, clientEmail) ||
                other.clientEmail == clientEmail) &&
            (identical(other.clientHousing, clientHousing) ||
                other.clientHousing == clientHousing) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.backupPhone, backupPhone) ||
                other.backupPhone == backupPhone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      referralType,
      creationDate,
      status,
      employeeName,
      employeePhoto,
      employeeEmail,
      employeeId,
      const DeepCollectionEquality().hash(_assets),
      clientDeposit,
      clientEmail,
      clientHousing,
      clientId,
      clientName,
      clientPhone,
      backupPhone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RentalCopyWith<_$_Rental> get copyWith =>
      __$$_RentalCopyWithImpl<_$_Rental>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RentalToJson(
      this,
    );
  }
}

abstract class _Rental implements Rental {
  factory _Rental(
      {final String? id,
      final String? referralType,
      required final DateTime creationDate,
      required final RentalStatus status,
      final String? employeeName,
      final String? employeePhoto,
      required final String employeeEmail,
      required final String employeeId,
      required final List<RentalAsset> assets,
      required final String clientDeposit,
      required final String clientEmail,
      required final String clientHousing,
      required final String clientId,
      required final String clientName,
      required final String clientPhone,
      final String? backupPhone}) = _$_Rental;

  factory _Rental.fromJson(Map<String, dynamic> json) = _$_Rental.fromJson;

  @override //Rental Metadata
  String? get id;
  @override
  String? get referralType;
  @override
  DateTime get creationDate;
  @override
  RentalStatus get status;
  @override //Employee Details
  String? get employeeName;
  @override
  String? get employeePhoto;
  @override
  String get employeeEmail;
  @override
  String get employeeId;
  @override //Rental Information
  List<RentalAsset> get assets;
  @override //Client Details
  String get clientDeposit;
  @override
  String get clientEmail;
  @override
  String get clientHousing;
  @override
  String get clientId;
  @override
  String get clientName;
  @override
  String get clientPhone;
  @override
  String? get backupPhone;
  @override
  @JsonKey(ignore: true)
  _$$_RentalCopyWith<_$_Rental> get copyWith =>
      throw _privateConstructorUsedError;
}
