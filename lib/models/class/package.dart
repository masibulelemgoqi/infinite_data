import 'package:cloud_firestore/cloud_firestore.dart';

class PackageData {
  final String _id, _name, _category;
  final double _price;
  final int _clientsMin, _clientsMax;
  const PackageData(this._id, this._name, this._category, this._price,
      this._clientsMin, this._clientsMax);
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

  setPackages(DocumentSnapshot doc) {
    String id = doc.id;
    Map<String, dynamic> data = doc.data();
    String name = data['name'];
    String category = data['category'];
    double price = data['price'];
    int clientsMin = data['clients_min'];
    int clientsMax = data['clients_max'];
    PackageData(id, name, category, price, clientsMin, clientsMax);
  }
}
