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
  String? get id => throw _privateConstructorUsedError; //Employee Details
  String get employeeId => throw _privateConstructorUsedError;
  String get employeeEmail => throw _privateConstructorUsedError;
  String? get employeeName => throw _privateConstructorUsedError;
  String? get employeePhoto =>
      throw _privateConstructorUsedError; //Rental Information
  List<RentalAsset> get assets => throw _privateConstructorUsedError;
  double? get initialMileage => throw _privateConstructorUsedError;
  double? get finalMileage => throw _privateConstructorUsedError;
  String? get damageReport => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get hoursRented => throw _privateConstructorUsedError;
  double get rentalPrice => throw _privateConstructorUsedError; //Client Details
  String get clientId => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientHousing => throw _privateConstructorUsedError;
  String get clientDeposit => throw _privateConstructorUsedError;
  String get clientPhone => throw _privateConstructorUsedError;
  String get clientEmail =>
      throw _privateConstructorUsedError; //Rental Metadata
  String? get backupPhone => throw _privateConstructorUsedError;
  String? get referralType => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
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
      String employeeEmail,
      String? employeeName,
      String? employeePhoto,
      List<RentalAsset> assets,
      double? initialMileage,
      double? finalMileage,
      String? damageReport,
      String? notes,
      int hoursRented,
      double rentalPrice,
      String clientId,
      String clientName,
      String clientHousing,
      String clientDeposit,
      String clientPhone,
      String clientEmail,
      String? backupPhone,
      String? referralType,
      DateTime creationDate,
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
    Object? employeeEmail = null,
    Object? employeeName = freezed,
    Object? employeePhoto = freezed,
    Object? assets = null,
    Object? initialMileage = freezed,
    Object? finalMileage = freezed,
    Object? damageReport = freezed,
    Object? notes = freezed,
    Object? hoursRented = null,
    Object? rentalPrice = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientHousing = null,
    Object? clientDeposit = null,
    Object? clientPhone = null,
    Object? clientEmail = null,
    Object? backupPhone = freezed,
    Object? referralType = freezed,
    Object? creationDate = null,
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
      employeeEmail: null == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
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
      hoursRented: null == hoursRented
          ? _value.hoursRented
          : hoursRented // ignore: cast_nullable_to_non_nullable
              as int,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
      clientEmail: null == clientEmail
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
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
      String employeeEmail,
      String? employeeName,
      String? employeePhoto,
      List<RentalAsset> assets,
      double? initialMileage,
      double? finalMileage,
      String? damageReport,
      String? notes,
      int hoursRented,
      double rentalPrice,
      String clientId,
      String clientName,
      String clientHousing,
      String clientDeposit,
      String clientPhone,
      String clientEmail,
      String? backupPhone,
      String? referralType,
      DateTime creationDate,
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
    Object? employeeEmail = null,
    Object? employeeName = freezed,
    Object? employeePhoto = freezed,
    Object? assets = null,
    Object? initialMileage = freezed,
    Object? finalMileage = freezed,
    Object? damageReport = freezed,
    Object? notes = freezed,
    Object? hoursRented = null,
    Object? rentalPrice = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientHousing = null,
    Object? clientDeposit = null,
    Object? clientPhone = null,
    Object? clientEmail = null,
    Object? backupPhone = freezed,
    Object? referralType = freezed,
    Object? creationDate = null,
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
      employeeEmail: null == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
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
      hoursRented: null == hoursRented
          ? _value.hoursRented
          : hoursRented // ignore: cast_nullable_to_non_nullable
              as int,
      rentalPrice: null == rentalPrice
          ? _value.rentalPrice
          : rentalPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
      clientEmail: null == clientEmail
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String,
      backupPhone: freezed == backupPhone
          ? _value.backupPhone
          : backupPhone // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rental implements _Rental {
  _$_Rental(
      {this.id,
      required this.employeeId,
      required this.employeeEmail,
      this.employeeName,
      this.employeePhoto,
      required final List<RentalAsset> assets,
      this.initialMileage,
      this.finalMileage,
      this.damageReport,
      this.notes,
      required this.hoursRented,
      required this.rentalPrice,
      required this.clientId,
      required this.clientName,
      required this.clientHousing,
      required this.clientDeposit,
      required this.clientPhone,
      required this.clientEmail,
      this.backupPhone,
      this.referralType,
      required this.creationDate,
      required this.status})
      : _assets = assets;

  factory _$_Rental.fromJson(Map<String, dynamic> json) =>
      _$$_RentalFromJson(json);

  @override
  final String? id;
//Employee Details
  @override
  final String employeeId;
  @override
  final String employeeEmail;
  @override
  final String? employeeName;
  @override
  final String? employeePhoto;
//Rental Information
  final List<RentalAsset> _assets;
//Rental Information
  @override
  List<RentalAsset> get assets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final double? initialMileage;
  @override
  final double? finalMileage;
  @override
  final String? damageReport;
  @override
  final String? notes;
  @override
  final int hoursRented;
  @override
  final double rentalPrice;
//Client Details
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
  final String clientEmail;
//Rental Metadata
  @override
  final String? backupPhone;
  @override
  final String? referralType;
  @override
  final DateTime creationDate;
  @override
  final RentalStatus status;

  @override
  String toString() {
    return 'Rental(id: $id, employeeId: $employeeId, employeeEmail: $employeeEmail, employeeName: $employeeName, employeePhoto: $employeePhoto, assets: $assets, initialMileage: $initialMileage, finalMileage: $finalMileage, damageReport: $damageReport, notes: $notes, hoursRented: $hoursRented, rentalPrice: $rentalPrice, clientId: $clientId, clientName: $clientName, clientHousing: $clientHousing, clientDeposit: $clientDeposit, clientPhone: $clientPhone, clientEmail: $clientEmail, backupPhone: $backupPhone, referralType: $referralType, creationDate: $creationDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rental &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeEmail, employeeEmail) ||
                other.employeeEmail == employeeEmail) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeePhoto, employeePhoto) ||
                other.employeePhoto == employeePhoto) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.initialMileage, initialMileage) ||
                other.initialMileage == initialMileage) &&
            (identical(other.finalMileage, finalMileage) ||
                other.finalMileage == finalMileage) &&
            (identical(other.damageReport, damageReport) ||
                other.damageReport == damageReport) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.hoursRented, hoursRented) ||
                other.hoursRented == hoursRented) &&
            (identical(other.rentalPrice, rentalPrice) ||
                other.rentalPrice == rentalPrice) &&
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
            (identical(other.clientEmail, clientEmail) ||
                other.clientEmail == clientEmail) &&
            (identical(other.backupPhone, backupPhone) ||
                other.backupPhone == backupPhone) &&
            (identical(other.referralType, referralType) ||
                other.referralType == referralType) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        employeeEmail,
        employeeName,
        employeePhoto,
        const DeepCollectionEquality().hash(_assets),
        initialMileage,
        finalMileage,
        damageReport,
        notes,
        hoursRented,
        rentalPrice,
        clientId,
        clientName,
        clientHousing,
        clientDeposit,
        clientPhone,
        clientEmail,
        backupPhone,
        referralType,
        creationDate,
        status
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
      required final String employeeEmail,
      final String? employeeName,
      final String? employeePhoto,
      required final List<RentalAsset> assets,
      final double? initialMileage,
      final double? finalMileage,
      final String? damageReport,
      final String? notes,
      required final int hoursRented,
      required final double rentalPrice,
      required final String clientId,
      required final String clientName,
      required final String clientHousing,
      required final String clientDeposit,
      required final String clientPhone,
      required final String clientEmail,
      final String? backupPhone,
      final String? referralType,
      required final DateTime creationDate,
      required final RentalStatus status}) = _$_Rental;

  factory _Rental.fromJson(Map<String, dynamic> json) = _$_Rental.fromJson;

  @override
  String? get id;
  @override //Employee Details
  String get employeeId;
  @override
  String get employeeEmail;
  @override
  String? get employeeName;
  @override
  String? get employeePhoto;
  @override //Rental Information
  List<RentalAsset> get assets;
  @override
  double? get initialMileage;
  @override
  double? get finalMileage;
  @override
  String? get damageReport;
  @override
  String? get notes;
  @override
  int get hoursRented;
  @override
  double get rentalPrice;
  @override //Client Details
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
  String get clientEmail;
  @override //Rental Metadata
  String? get backupPhone;
  @override
  String? get referralType;
  @override
  DateTime get creationDate;
  @override
  RentalStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_RentalCopyWith<_$_Rental> get copyWith =>
      throw _privateConstructorUsedError;
}
