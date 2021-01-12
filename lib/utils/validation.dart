import 'package:infinite_data/models/data/responseHandler.dart';

class Validator {
  ResponseHander validName(name) {
    if (name.length < 3) {
      return new ResponseHander(false, 'Name should be at least 3 letters');
    }
    return new ResponseHander(true, '');
  }

  ResponseHander validAddress(address) {
    if (address.length < 3) {
      return new ResponseHander(false, 'Address should be at least 3 letters');
    }
    return new ResponseHander(true, '');
  }

  ResponseHander validContactNumber(contactNumber) {
    if (contactNumber.length < 10) {
      return new ResponseHander(false, 'Invalid contact number');
    }
    return new ResponseHander(true, '');
  }

  ResponseHander validEmail(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.length < 3) {
      return new ResponseHander(false, 'Email should be at least 3 letters');
    } else if (!emailValid) {
      return new ResponseHander(false, 'Email is invalid');
    }
    return new ResponseHander(true, '');
  }

  ResponseHander validPassword({password, verifyPassword}) {
    if (password.length < 6 || verifyPassword.length < 6) {
      return new ResponseHander(
          false, 'Password should be at least 6 characters');
    } else if (password.toString().trim() != verifyPassword.toString().trim()) {
      return new ResponseHander(false, 'Password do not match');
    }
    return new ResponseHander(true, '');
  }
}
