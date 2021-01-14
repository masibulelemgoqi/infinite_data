import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Constants {
  static FirebaseAuth AUTH = FirebaseAuth.instance;

  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Collections
  static final CLIENT_COLLECTION = _firestore.collection('client');
  static final USER_COLLECTION = _firestore.collection('user');
  static final COMPANY_COLLECTION = _firestore.collection('company');
  static final RECEIPT_COLLECTION = (String companyId) =>
      COMPANY_COLLECTION.doc(companyId).collection('receipt');
  static final PACKAGE_COLLECTION = _firestore.collection('package');
  static final SCREENING_COLLECTION =
      (String id) => CLIENT_COLLECTION.doc(id).collection('screening');
  static final DATE_NOW = FieldValue.serverTimestamp();
}
