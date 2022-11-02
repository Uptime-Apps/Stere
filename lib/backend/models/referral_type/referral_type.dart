import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_type.freezed.dart';
part 'referral_type.g.dart';

@freezed
class ReferralType with _$ReferralType {
  factory ReferralType({
    String? id,
    required String name,
    String? description,
  }) = _ReferralType;
  factory ReferralType.fromJson(Map<String, dynamic> json) =>
      _$ReferralTypeFromJson(json);
}
