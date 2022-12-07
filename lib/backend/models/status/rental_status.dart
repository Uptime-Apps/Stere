import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/icons.dart';
import '../../../l10n/generated/l10n.dart';

enum RentalStatus {
  active,
  finished,
  canceled,
  overdue,
}

extension RentalStatusExtension on RentalStatus {
  String get local {
    switch (this) {
      case RentalStatus.active:
        return S.current.ttActive;
      case RentalStatus.finished:
        return S.current.ttFinished;
      case RentalStatus.canceled:
        return S.current.ttCanceled;
      case RentalStatus.overdue:
        return S.current.ttOverdue;
      default:
        return S.current.ttUndefined;
    }
  }

  Color? get color {
    switch (this) {
      case RentalStatus.active:
        return clActive;
      case RentalStatus.overdue:
        return clOverdue;
      case RentalStatus.canceled:
        return clCanceled;
      case RentalStatus.finished:
        return clFinished;
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
  String get local {
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
  rented,
  available,
  unavailable,
  discarded,
  maintenance,
}

extension AssetExtension on AssetStatus {
  String get local {
    switch (this) {
      case AssetStatus.available:
        return S.current.ttAvailable;
      case AssetStatus.unavailable:
        return S.current.ttUnavailable;
      case AssetStatus.maintenance:
        return S.current.ttMaintenance;
      case AssetStatus.discarded:
        return S.current.ttDiscarded;
      case AssetStatus.rented:
        return S.current.ttRented;
      default:
        return S.current.ttUndefined;
    }
  }

  IconData? get icon {
    switch (this) {
      case AssetStatus.available:
        return icAssetStatusAvailable;
      case AssetStatus.maintenance:
        return icAssetStatusMaintenance;
      case AssetStatus.discarded:
        return icAssetStatusDiscarded;
      case AssetStatus.rented:
        return icAssetStatusRented;
      case AssetStatus.unavailable:
        return icAssetStatusUnavailable;
      default:
        return null;
    }
  }

  Color? get color {
    switch (this) {
      case AssetStatus.available:
        return clAvailable;
      case AssetStatus.maintenance:
        return clMaintenance;
      case AssetStatus.discarded:
        return clDiscarded;
      case AssetStatus.rented:
        return clRented;
      case AssetStatus.unavailable:
        return clUnavailable;
      default:
        return null;
    }
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
