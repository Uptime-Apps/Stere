enum RentalStatus {
  active,
  completed,
  canceled,
  overdue,
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
