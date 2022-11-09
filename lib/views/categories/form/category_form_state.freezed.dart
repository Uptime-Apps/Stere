// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryFormState {
  GlobalKey<FormState> get formKey => throw _privateConstructorUsedError;
  TextEditingController get nameController =>
      throw _privateConstructorUsedError;
  TextEditingController get tagController => throw _privateConstructorUsedError;
  bool get isAutomotive => throw _privateConstructorUsedError;
  AsyncValue<String> get result => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryFormStateCopyWith<CategoryFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormStateCopyWith<$Res> {
  factory $CategoryFormStateCopyWith(
          CategoryFormState value, $Res Function(CategoryFormState) then) =
      _$CategoryFormStateCopyWithImpl<$Res, CategoryFormState>;
  @useResult
  $Res call(
      {GlobalKey<FormState> formKey,
      TextEditingController nameController,
      TextEditingController tagController,
      bool isAutomotive,
      AsyncValue<String> result,
      String? errorText,
      File? imageFile,
      List<String> tags});
}

/// @nodoc
class _$CategoryFormStateCopyWithImpl<$Res, $Val extends CategoryFormState>
    implements $CategoryFormStateCopyWith<$Res> {
  _$CategoryFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? nameController = null,
    Object? tagController = null,
    Object? isAutomotive = null,
    Object? result = null,
    Object? errorText = freezed,
    Object? imageFile = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      tagController: null == tagController
          ? _value.tagController
          : tagController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isAutomotive: null == isAutomotive
          ? _value.isAutomotive
          : isAutomotive // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryFormStateCopyWith<$Res>
    implements $CategoryFormStateCopyWith<$Res> {
  factory _$$_CategoryFormStateCopyWith(_$_CategoryFormState value,
          $Res Function(_$_CategoryFormState) then) =
      __$$_CategoryFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GlobalKey<FormState> formKey,
      TextEditingController nameController,
      TextEditingController tagController,
      bool isAutomotive,
      AsyncValue<String> result,
      String? errorText,
      File? imageFile,
      List<String> tags});
}

/// @nodoc
class __$$_CategoryFormStateCopyWithImpl<$Res>
    extends _$CategoryFormStateCopyWithImpl<$Res, _$_CategoryFormState>
    implements _$$_CategoryFormStateCopyWith<$Res> {
  __$$_CategoryFormStateCopyWithImpl(
      _$_CategoryFormState _value, $Res Function(_$_CategoryFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? nameController = null,
    Object? tagController = null,
    Object? isAutomotive = null,
    Object? result = null,
    Object? errorText = freezed,
    Object? imageFile = freezed,
    Object? tags = null,
  }) {
    return _then(_$_CategoryFormState(
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      tagController: null == tagController
          ? _value.tagController
          : tagController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isAutomotive: null == isAutomotive
          ? _value.isAutomotive
          : isAutomotive // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CategoryFormState implements _CategoryFormState {
  _$_CategoryFormState(
      {required this.formKey,
      required this.nameController,
      required this.tagController,
      this.isAutomotive = false,
      required this.result,
      this.errorText,
      this.imageFile,
      final List<String> tags = const []})
      : _tags = tags;

  @override
  final GlobalKey<FormState> formKey;
  @override
  final TextEditingController nameController;
  @override
  final TextEditingController tagController;
  @override
  @JsonKey()
  final bool isAutomotive;
  @override
  final AsyncValue<String> result;
  @override
  final String? errorText;
  @override
  final File? imageFile;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'CategoryFormState(formKey: $formKey, nameController: $nameController, tagController: $tagController, isAutomotive: $isAutomotive, result: $result, errorText: $errorText, imageFile: $imageFile, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryFormState &&
            (identical(other.formKey, formKey) || other.formKey == formKey) &&
            (identical(other.nameController, nameController) ||
                other.nameController == nameController) &&
            (identical(other.tagController, tagController) ||
                other.tagController == tagController) &&
            (identical(other.isAutomotive, isAutomotive) ||
                other.isAutomotive == isAutomotive) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      formKey,
      nameController,
      tagController,
      isAutomotive,
      result,
      errorText,
      imageFile,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryFormStateCopyWith<_$_CategoryFormState> get copyWith =>
      __$$_CategoryFormStateCopyWithImpl<_$_CategoryFormState>(
          this, _$identity);
}

abstract class _CategoryFormState implements CategoryFormState {
  factory _CategoryFormState(
      {required final GlobalKey<FormState> formKey,
      required final TextEditingController nameController,
      required final TextEditingController tagController,
      final bool isAutomotive,
      required final AsyncValue<String> result,
      final String? errorText,
      final File? imageFile,
      final List<String> tags}) = _$_CategoryFormState;

  @override
  GlobalKey<FormState> get formKey;
  @override
  TextEditingController get nameController;
  @override
  TextEditingController get tagController;
  @override
  bool get isAutomotive;
  @override
  AsyncValue<String> get result;
  @override
  String? get errorText;
  @override
  File? get imageFile;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryFormStateCopyWith<_$_CategoryFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
