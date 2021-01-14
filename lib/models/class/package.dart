import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/utils/constants.dart';

class Package {
  String _id, _name, _category;
  int _clientsMin, _clientsMax, _price;
  Package({id, name, category, price, clientsMin, clientsMax}) {
    _id = id;
    _name = name;
    _category = category;
    _price = price;
    _clientsMin = clientsMin;
    _clientsMax = clientsMax;
  }
  getId() {
    return this._id;
  }

  getName() {
    return this._name;
  }

  getCategory() {
    return this._category;
  }

  getPrice() {
    return this._price;
  }

  getClientsMin() {
    return this._clientsMin;
  }

  getClientsMax() {
    return this._clientsMax;
  }

  populatePackages(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data();
    _id = doc.id;
    _name = data['name'];
    _category = data['category'];
    _price = data['price'];
    _clientsMin = data['min_clients'];
    _clientsMax = data['max_clients'];
  }

  Stream<QuerySnapshot> getPackages(String category) {
    return Constants.PACKAGE_COLLECTION
        .where('category', isEqualTo: category.trim())
        .orderBy('price')
        .snapshots();
  }
}
