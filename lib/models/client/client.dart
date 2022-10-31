import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  factory Client({
    String? id,
    required String fullName,
    required String phoneNumber,
    required String email,
  }) = _Client;
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
