import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../backend/models/category/category.dart';
import '../../backend/models/rental/rental.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    AsyncValue<Stream<List<Category>>>? categories,
    AsyncValue<Stream<List<Rental>>>? activeRentals,
  }) = _HomeState;
}
