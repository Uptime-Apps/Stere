// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rental_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RentalFormState {
//Form Metadata
  int get currentStep => throw _privateConstructorUsedError;
  bool get validForm => throw _privateConstructorUsedError;
  AsyncValue<Future<List<Asset>>?> get assets =>
      throw _privateConstructorUsedError;
  AsyncValue<String> get result => throw _privateConstructorUsedError;
  GlobalKey<FormState> get formKey =>
      throw _privateConstructorUsedError; //Rental Metadata
  AsyncValue<ReferralType?> get referralType =>
      throw _privateConstructorUsedError;
  RentalStatus get status =>
      throw _privateConstructorUsedError; //Rental Information
  List<RentalAsset> get selectedAssets =>
      throw _privateConstructorUsedError; // int? hoursRented,
// required TextEditingController damageReportController,
// required TextEditingController finalMileageController,
// required TextEditingController initialMileageController,
// required TextEditingController notesController,
// required TextEditingController rentalPriceController,
//Client Details
  AsyncValue<String> get clientDeposit => throw _privateConstructorUsedError;
  TextEditingController get clientEmailController =>
      throw _privateConstructorUsedError;
  TextEditingController get backupPhoneController =>
      throw _privateConstructorUsedError;
  TextEditingController get clientHousingController =>
      throw _privateConstructorUsedError;
  TextEditingController get clientIdController =>
      throw _privateConstructorUsedError;
  TextEditingController get clientNameController =>
      throw _privateConstructorUsedError;
  TextEditingController get clientPhoneController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RentalFormStateCopyWith<RentalFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalFormStateCopyWith<$Res> {
  factory $RentalFormStateCopyWith(
          RentalFormState value, $Res Function(RentalFormState) then) =
      _$RentalFormStateCopyWithImpl<$Res, RentalFormState>;
  @useResult
  $Res call(
      {int currentStep,
      bool validForm,
      AsyncValue<Future<List<Asset>>?> assets,
      AsyncValue<String> result,
      GlobalKey<FormState> formKey,
      AsyncValue<ReferralType?> referralType,
      RentalStatus status,
      List<RentalAsset> selectedAssets,
      AsyncValue<String> clientDeposit,
      TextEditingController clientEmailController,
      TextEditingController backupPhoneController,
      TextEditingController clientHousingController,
      TextEditingController clientIdController,
      TextEditingController clientNameController,
      TextEditingController clientPhoneController});
}

/// @nodoc
class _$RentalFormStateCopyWithImpl<$Res, $Val extends RentalFormState>
    implements $RentalFormStateCopyWith<$Res> {
  _$RentalFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? validForm = null,
    Object? assets = null,
    Object? result = null,
    Object? formKey = null,
    Object? referralType = null,
    Object? status = null,
    Object? selectedAssets = null,
    Object? clientDeposit = null,
    Object? clientEmailController = null,
    Object? backupPhoneController = null,
    Object? clientHousingController = null,
    Object? clientIdController = null,
    Object? clientNameController = null,
    Object? clientPhoneController = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      validForm: null == validForm
          ? _value.validForm
          : validForm // ignore: cast_nullable_to_non_nullable
              as bool,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Future<List<Asset>>?>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      referralType: null == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ReferralType?>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
      selectedAssets: null == selectedAssets
          ? _value.selectedAssets
          : selectedAssets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      clientEmailController: null == clientEmailController
          ? _value.clientEmailController
          : clientEmailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      backupPhoneController: null == backupPhoneController
          ? _value.backupPhoneController
          : backupPhoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientHousingController: null == clientHousingController
          ? _value.clientHousingController
          : clientHousingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientIdController: null == clientIdController
          ? _value.clientIdController
          : clientIdController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientNameController: null == clientNameController
          ? _value.clientNameController
          : clientNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientPhoneController: null == clientPhoneController
          ? _value.clientPhoneController
          : clientPhoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RentalFormStateCopyWith<$Res>
    implements $RentalFormStateCopyWith<$Res> {
  factory _$$_RentalFormStateCopyWith(
          _$_RentalFormState value, $Res Function(_$_RentalFormState) then) =
      __$$_RentalFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      bool validForm,
      AsyncValue<Future<List<Asset>>?> assets,
      AsyncValue<String> result,
      GlobalKey<FormState> formKey,
      AsyncValue<ReferralType?> referralType,
      RentalStatus status,
      List<RentalAsset> selectedAssets,
      AsyncValue<String> clientDeposit,
      TextEditingController clientEmailController,
      TextEditingController backupPhoneController,
      TextEditingController clientHousingController,
      TextEditingController clientIdController,
      TextEditingController clientNameController,
      TextEditingController clientPhoneController});
}

/// @nodoc
class __$$_RentalFormStateCopyWithImpl<$Res>
    extends _$RentalFormStateCopyWithImpl<$Res, _$_RentalFormState>
    implements _$$_RentalFormStateCopyWith<$Res> {
  __$$_RentalFormStateCopyWithImpl(
      _$_RentalFormState _value, $Res Function(_$_RentalFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? validForm = null,
    Object? assets = null,
    Object? result = null,
    Object? formKey = null,
    Object? referralType = null,
    Object? status = null,
    Object? selectedAssets = null,
    Object? clientDeposit = null,
    Object? clientEmailController = null,
    Object? backupPhoneController = null,
    Object? clientHousingController = null,
    Object? clientIdController = null,
    Object? clientNameController = null,
    Object? clientPhoneController = null,
  }) {
    return _then(_$_RentalFormState(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      validForm: null == validForm
          ? _value.validForm
          : validForm // ignore: cast_nullable_to_non_nullable
              as bool,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Future<List<Asset>>?>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      referralType: null == referralType
          ? _value.referralType
          : referralType // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ReferralType?>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RentalStatus,
      selectedAssets: null == selectedAssets
          ? _value._selectedAssets
          : selectedAssets // ignore: cast_nullable_to_non_nullable
              as List<RentalAsset>,
      clientDeposit: null == clientDeposit
          ? _value.clientDeposit
          : clientDeposit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      clientEmailController: null == clientEmailController
          ? _value.clientEmailController
          : clientEmailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      backupPhoneController: null == backupPhoneController
          ? _value.backupPhoneController
          : backupPhoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientHousingController: null == clientHousingController
          ? _value.clientHousingController
          : clientHousingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientIdController: null == clientIdController
          ? _value.clientIdController
          : clientIdController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientNameController: null == clientNameController
          ? _value.clientNameController
          : clientNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      clientPhoneController: null == clientPhoneController
          ? _value.clientPhoneController
          : clientPhoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_RentalFormState implements _RentalFormState {
  _$_RentalFormState(
      {this.currentStep = 0,
      this.validForm = false,
      required this.assets,
      required this.result,
      required this.formKey,
      required this.referralType,
      required this.status,
      final List<RentalAsset> selectedAssets = const [],
      required this.clientDeposit,
      required this.clientEmailController,
      required this.backupPhoneController,
      required this.clientHousingController,
      required this.clientIdController,
      required this.clientNameController,
      required this.clientPhoneController})
      : _selectedAssets = selectedAssets;

//Form Metadata
  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final bool validForm;
  @override
  final AsyncValue<Future<List<Asset>>?> assets;
  @override
  final AsyncValue<String> result;
  @override
  final GlobalKey<FormState> formKey;
//Rental Metadata
  @override
  final AsyncValue<ReferralType?> referralType;
  @override
  final RentalStatus status;
//Rental Information
  final List<RentalAsset> _selectedAssets;
//Rental Information
  @override
  @JsonKey()
  List<RentalAsset> get selectedAssets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAssets);
  }

// int? hoursRented,
// required TextEditingController damageReportController,
// required TextEditingController finalMileageController,
// required TextEditingController initialMileageController,
// required TextEditingController notesController,
// required TextEditingController rentalPriceController,
//Client Details
  @override
  final AsyncValue<String> clientDeposit;
  @override
  final TextEditingController clientEmailController;
  @override
  final TextEditingController backupPhoneController;
  @override
  final TextEditingController clientHousingController;
  @override
  final TextEditingController clientIdController;
  @override
  final TextEditingController clientNameController;
  @override
  final TextEditingController clientPhoneController;

  @override
  String toString() {
    return 'RentalFormState(currentStep: $currentStep, validForm: $validForm, assets: $assets, result: $result, formKey: $formKey, referralType: $referralType, status: $status, selectedAssets: $selectedAssets, clientDeposit: $clientDeposit, clientEmailController: $clientEmailController, backupPhoneController: $backupPhoneController, clientHousingController: $clientHousingController, clientIdController: $clientIdController, clientNameController: $clientNameController, clientPhoneController: $clientPhoneController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RentalFormState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.validForm, validForm) ||
                other.validForm == validForm) &&
            (identical(other.assets, assets) || other.assets == assets) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.referralType, referralType) ||
                other.referralType == referralType) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._selectedAssets, _selectedAssets) &&
            (identical(other.clientDeposit, clientDeposit) ||
                other.clientDeposit == clientDeposit) &&
            (identical(other.clientEmailController, clientEmailController) ||
                other.clientEmailController == clientEmailController) &&
            (identical(other.backupPhoneController, backupPhoneController) ||
                other.backupPhoneController == backupPhoneController) &&
            (identical(
                    other.clientHousingController, clientHousingController) ||
                other.clientHousingController == clientHousingController) &&
            (identical(other.clientIdController, clientIdController) ||
                other.clientIdController == clientIdController) &&
            (identical(other.clientNameController, clientNameController) ||
                other.clientNameController == clientNameController) &&
            (identical(other.clientPhoneController, clientPhoneController) ||
                other.clientPhoneController == clientPhoneController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      validForm,
      assets,
      result,
      formKey,
      referralType,
      status,
      const DeepCollectionEquality().hash(_selectedAssets),
      clientDeposit,
      clientEmailController,
      backupPhoneController,
      clientHousingController,
      clientIdController,
      clientNameController,
      clientPhoneController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RentalFormStateCopyWith<_$_RentalFormState> get copyWith =>
      __$$_RentalFormStateCopyWithImpl<_$_RentalFormState>(this, _$identity);
}

abstract class _RentalFormState implements RentalFormState {
  factory _RentalFormState(
          {final int currentStep,
          final bool validForm,
          required final AsyncValue<Future<List<Asset>>?> assets,
          required final AsyncValue<String> result,
          required final GlobalKey<FormState> formKey,
          required final AsyncValue<ReferralType?> referralType,
          required final RentalStatus status,
          final List<RentalAsset> selectedAssets,
          required final AsyncValue<String> clientDeposit,
          required final TextEditingController clientEmailController,
          required final TextEditingController backupPhoneController,
          required final TextEditingController clientHousingController,
          required final TextEditingController clientIdController,
          required final TextEditingController clientNameController,
          required final TextEditingController clientPhoneController}) =
      _$_RentalFormState;

  @override //Form Metadata
  int get currentStep;
  @override
  bool get validForm;
  @override
  AsyncValue<Future<List<Asset>>?> get assets;
  @override
  AsyncValue<String> get result;
  @override
  GlobalKey<FormState> get formKey;
  @override //Rental Metadata
  AsyncValue<ReferralType?> get referralType;
  @override
  RentalStatus get status;
  @override //Rental Information
  List<RentalAsset> get selectedAssets;
  @override // int? hoursRented,
// required TextEditingController damageReportController,
// required TextEditingController finalMileageController,
// required TextEditingController initialMileageController,
// required TextEditingController notesController,
// required TextEditingController rentalPriceController,
//Client Details
  AsyncValue<String> get clientDeposit;
  @override
  TextEditingController get clientEmailController;
  @override
  TextEditingController get backupPhoneController;
  @override
  TextEditingController get clientHousingController;
  @override
  TextEditingController get clientIdController;
  @override
  TextEditingController get clientNameController;
  @override
  TextEditingController get clientPhoneController;
  @override
  @JsonKey(ignore: true)
  _$$_RentalFormStateCopyWith<_$_RentalFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
