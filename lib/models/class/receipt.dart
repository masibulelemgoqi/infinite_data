import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/utils/constants.dart';

class Receipt {
  String _transactionId, _companyId, _id;
  double _amount;
  Timestamp _createdAt, _nextBillingDate;

  Receipt({id, transactionId, companyId, amount, createdAt, nextBillingDate}) {
    _id = id;
    _transactionId = transactionId;
    _companyId = companyId;
    _amount = amount;
    _createdAt = createdAt;
    _nextBillingDate = nextBillingDate;
  }

  populateReceipt(DocumentSnapshot doc) {
    _id = doc.id;
    Map<String, dynamic> data = doc.data();
    _transactionId = data['transaction_id'];
    _companyId = data['company_id'];
    _amount = data['amount'];
    _createdAt = data['created_at'];
    _nextBillingDate = data['next_billing_date'];
  }

  Stream<QuerySnapshot> getReceipts(String companyId) {
    return Constants.RECEIPT_COLLECTION(companyId)
        .orderBy('created_at')
        .limitToLast(1)
        .snapshots();
  }
}
