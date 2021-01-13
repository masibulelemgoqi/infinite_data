import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/utils/constants.dart';

class Screening {
  String _id, _status, _companyId;
  double _temperature;

  Screening({id, status, temperature, companyId}) {
    _id = id;
    _status = status;
    _temperature = temperature;
    _companyId = companyId;
  }

  getId() {
    return _id;
  }

  getStatus() {
    return _status;
  }

  getTemperature() {
    return _temperature;
  }

  getCompanyId() {
    return _companyId;
  }

  Stream<QuerySnapshot> getScreening(String id) {
    return Constants.SCREENING_COLLECTION(id).snapshots();
  }
}
