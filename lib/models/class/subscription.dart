import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionData {
  String _packageId, _packageName;
  double _packagePrice;
  Timestamp _nextBillingDate;
  SubscriptionData(
      {String packageId,
      String packageName,
      double packagePrice,
      Timestamp nextBillingDate}) {
    _packageId = packageId;
    _packageName = packageName;
    _packagePrice = packagePrice;
    _nextBillingDate = nextBillingDate;
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

  getNextBillingDate() {
    return _nextBillingDate;
  }
}
