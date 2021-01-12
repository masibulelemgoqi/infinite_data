class SubscriptionData {
  String _packageId, _packageName;
  double _packagePrice;
  SubscriptionData(
      {String packageId, String packageName, double packagePrice}) {
    _packageId = packageId;
    _packageName = packageName;
    _packagePrice = packagePrice;
  }

  getPackageId() {
    return _packageId;
  }

  getPackageName() {
    return _packageName;
  }

  getPackagePrice() {
    return _packagePrice;
  }
}
