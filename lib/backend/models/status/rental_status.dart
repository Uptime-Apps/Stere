import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../l10n/generated/l10n.dart';

enum RentalStatus {
  active,
  completed,
  canceled,
  overdue,
}

extension RentalStatusExtension on RentalStatus {
  Color? get color {
    switch (this) {
      case RentalStatus.active:
        return clActive;
      case RentalStatus.overdue:
        return clOverdue;
      case RentalStatus.canceled:
        return clCanceled;
      case RentalStatus.completed:
        return clCompleted;
      default:
        return null;
    }
  }
}

enum RentalAssetStatus {
  ready,
  incomplete,
  available,
  unavailable,
  discarded,
  rented,
  maintenance,
}

extension RentalAssetExtension on RentalAssetStatus {
  String get name {
    switch (this) {
      case RentalAssetStatus.ready:
        return S.current.ttReady;
      case RentalAssetStatus.incomplete:
        return S.current.ttIncomplete;
      default:
        return S.current.ttUndefined;
    }
  }
}

enum AssetStatus {
  available,
  unavailable,
  discarded,
  rented,
  maintenance,
}

extension ParseToString on AssetStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}

AssetStatus? getStatusFromString(String statusAsString) {
  for (AssetStatus element in AssetStatus.values) {
    if (element.toString() == 'AssetStatus.$statusAsString') {
      return element;
    }
  }
  return null;
}
