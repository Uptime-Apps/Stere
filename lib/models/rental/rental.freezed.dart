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
  String? get id => throw _privateConstructorUsedError;
  String get employeeId => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String? get employeePhoto => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientHousing => throw _privateConstructorUsedError;
  String get clientDeposit => throw _privateConstructorUsedError;
  String get clientPhone => throw _privateConstructorUsedError;
  String? get backupPhone => throw _privateConstructorUsedError;
  String get assetId => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  String? get assetPhoto => throw _privateConstructorUsedError;
  double? get initialMileage => throw _privateConstructorUsedError;
  double? get finalMileage => throw _privateConstructorUsedError;
  String? get damageReport => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get referralType => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  int get hoursRented => throw _privateConstructorUsedError;
  double get rentalPrice => throw _privateConstructorUsedError;
  RentalStatus get status => throw _privateConstructorUsedError;

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
      String employeeId,
      String employeeName,
      String? employeePhoto,
      String clientId,
      String clientName,
      String clientHousing,
      String clientDeposit,
      String clientPhone,
      String? backupPhone,
      String assetId,
      String assetName,
      String? assetPhoto,
      double? initialMileage,
      double? finalMileage,
      String? damageReport,
      String? notes,
      String referralType,
      DateTime creationDate,
      int hoursRented,
      double rentalPrice,
      RentalStatus status});
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
    Object? employeeId = null,
    Object? employeeName = null,
    Object? employeePhoto = freezed,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientHousing = null,
    Object? clientDeposit = null,
    Object? clientPhone = null,
    Object? backupPhone = freezed,
    Object? assetId = null,
    Object? assetName = null,
    Object? assetPhoto = freezed,
    Object? initialMileage = freezed,
    Object? finalMileage = freezed,
    Object? damageReport = freezed,
    Object? notes = freezed,
    Object? referralType = null,
    Object? creationDate = null,
    Object? hoursRented = null,
    Object? rentalPrice = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientHousing: null == clientHousing
          ? _value.clientHousing
          : clientHousing // ignore: cast_nullable_to_non_nullable
              as String,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPhoto: freezed == assetPhoto
          ? _value.assetPhoto
          : assetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      initialMileage: freezed == initialMileage
          ? _value.initialMileage
          : initialMileage // ignore: cast_nullable_to_non_nullable
              as double?,
      finalMileage: freezed == finalMileage
          ? _value.finalMileage
          : finalMileage // ignore: cast_nullable_to_non_nullable
              as double?,
      damageReport: freezed == damageReport
          ? _value.damageReport
          : damageReport // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      referralType: null == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hoursRented: null == hoursRented
          ? _value.hoursRented
          : hoursRented // ignore: cast_nullable_to_non_nullable
              as int,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
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
      String employeeId,
      String employeeName,
      String? employeePhoto,
      String clientId,
      String clientName,
      String clientHousing,
      String clientDeposit,
      String clientPhone,
      String? backupPhone,
      String assetId,
      String assetName,
      String? assetPhoto,
      double? initialMileage,
      double? finalMileage,
      String? damageReport,
      String? notes,
      String referralType,
      DateTime creationDate,
      int hoursRented,
      double rentalPrice,
      RentalStatus status});
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
    Object? employeeId = null,
    Object? employeeName = null,
    Object? employeePhoto = freezed,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientHousing = null,
    Object? clientDeposit = null,
    Object? clientPhone = null,
    Object? backupPhone = freezed,
    Object? assetId = null,
    Object? assetName = null,
    Object? assetPhoto = freezed,
    Object? initialMileage = freezed,
    Object? finalMileage = freezed,
    Object? damageReport = freezed,
    Object? notes = freezed,
    Object? referralType = null,
    Object? creationDate = null,
    Object? hoursRented = null,
    Object? rentalPrice = null,
    Object? status = null,
  }) {
    return _then(_$_Rental(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientHousing: null == clientHousing
          ? _value.clientHousing
          : clientHousing // ignore: cast_nullable_to_non_nullable
              as String,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPhoto: freezed == assetPhoto
          ? _value.assetPhoto
          : assetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      initialMileage: freezed == initialMileage
          ? _value.initialMileage
          : initialMileage // ignore: cast_nullable_to_non_nullable
              as double?,
      finalMileage: freezed == finalMileage
          ? _value.finalMileage
          : finalMileage // ignore: cast_nullable_to_non_nullable
              as double?,
      damageReport: freezed == damageReport
          ? _value.damageReport
          : damageReport // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      referralType: null == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hoursRented: null == hoursRented
          ? _value.hoursRented
          : hoursRented // ignore: cast_nullable_to_non_nullable
              as int,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rental implements _Rental {
  _$_Rental(
      {this.id,
      required this.employeeId,
      required this.employeeName,
      this.employeePhoto,
      required this.clientId,
      required this.clientName,
      required this.clientHousing,
      required this.clientDeposit,
      required this.clientPhone,
      this.backupPhone,
      required this.assetId,
      required this.assetName,
      this.assetPhoto,
      this.initialMileage,
      this.finalMileage,
      this.damageReport,
      this.notes,
      required this.referralType,
      required this.creationDate,
      required this.hoursRented,
      required this.rentalPrice,
      required this.status});

  factory _$_Rental.fromJson(Map<String, dynamic> json) =>
      _$$_RentalFromJson(json);

  @override
  final String? id;
  @override
  final String employeeId;
  @override
  final String employeeName;
  @override
  final String? employeePhoto;
  @override
  final String clientId;
  @override
  final String clientName;
  @override
  final String clientHousing;
  @override
  final String clientDeposit;
  @override
  final String clientPhone;
  @override
  final String? backupPhone;
  @override
  final String assetId;
  @override
  final String assetName;
  @override
  final String? assetPhoto;
  @override
  final double? initialMileage;
  @override
  final double? finalMileage;
  @override
  final String? damageReport;
  @override
  final String? notes;
  @override
  final String referralType;
  @override
  final DateTime creationDate;
  @override
  final int hoursRented;
  @override
  final double rentalPrice;
  @override
  final RentalStatus status;

  @override
  String toString() {
    return 'Rental(id: $id, employeeId: $employeeId, employeeName: $employeeName, employeePhoto: $employeePhoto, clientId: $clientId, clientName: $clientName, clientHousing: $clientHousing, clientDeposit: $clientDeposit, clientPhone: $clientPhone, backupPhone: $backupPhone, assetId: $assetId, assetName: $assetName, assetPhoto: $assetPhoto, initialMileage: $initialMileage, finalMileage: $finalMileage, damageReport: $damageReport, notes: $notes, referralType: $referralType, creationDate: $creationDate, hoursRented: $hoursRented, rentalPrice: $rentalPrice, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rental &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeePhoto, employeePhoto) ||
                other.employeePhoto == employeePhoto) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientHousing, clientHousing) ||
                other.clientHousing == clientHousing) &&
            (identical(other.clientDeposit, clientDeposit) ||
                other.clientDeposit == clientDeposit) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.backupPhone, backupPhone) ||
                other.backupPhone == backupPhone) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetPhoto, assetPhoto) ||
                other.assetPhoto == assetPhoto) &&
            (identical(other.initialMileage, initialMileage) ||
                other.initialMileage == initialMileage) &&
            (identical(other.finalMileage, finalMileage) ||
                other.finalMileage == finalMileage) &&
            (identical(other.damageReport, damageReport) ||
                other.damageReport == damageReport) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.referralType, referralType) ||
                other.referralType == referralType) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.hoursRented, hoursRented) ||
                other.hoursRented == hoursRented) &&
            (identical(other.rentalPrice, rentalPrice) ||
                other.rentalPrice == rentalPrice) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        employeeName,
        employeePhoto,
        clientId,
        clientName,
        clientHousing,
        clientDeposit,
        clientPhone,
        backupPhone,
        assetId,
        assetName,
        assetPhoto,
        initialMileage,
        finalMileage,
        damageReport,
        notes,
        referralType,
        creationDate,
        hoursRented,
        rentalPrice,
        const DeepCollectionEquality().hash(status)
      ]);

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
      required final String employeeId,
      required final String employeeName,
      final String? employeePhoto,
      required final String clientId,
      required final String clientName,
      required final String clientHousing,
      required final String clientDeposit,
      required final String clientPhone,
      final String? backupPhone,
      required final String assetId,
      required final String assetName,
      final String? assetPhoto,
      final double? initialMileage,
      final double? finalMileage,
      final String? damageReport,
      final String? notes,
      required final String referralType,
      required final DateTime creationDate,
      required final int hoursRented,
      required final double rentalPrice,
      required final RentalStatus status}) = _$_Rental;

  factory _Rental.fromJson(Map<String, dynamic> json) = _$_Rental.fromJson;

  @override
  String? get id;
  @override
  String get employeeId;
  @override
  String get employeeName;
  @override
  String? get employeePhoto;
  @override
  String get clientId;
  @override
  String get clientName;
  @override
  String get clientHousing;
  @override
  String get clientDeposit;
  @override
  String get clientPhone;
  @override
  String? get backupPhone;
  @override
  String get assetId;
  @override
  String get assetName;
  @override
  String? get assetPhoto;
  @override
  double? get initialMileage;
  @override
  double? get finalMileage;
  @override
  String? get damageReport;
  @override
  String? get notes;
  @override
  String get referralType;
  @override
  DateTime get creationDate;
  @override
  int get hoursRented;
  @override
  double get rentalPrice;
  @override
  RentalStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_RentalCopyWith<_$_Rental> get copyWith =>
      throw _privateConstructorUsedError;
}
