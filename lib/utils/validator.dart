import 'package:infinite_data/models/data/responseHandler.dart';

class Validator {
  ResponseHandler validName(name) {
    if (name.length < 3) {
      return new ResponseHandler(false, 'Name should be at least 3 letters');
    }
    return new ResponseHandler(true, '');
  }

  ResponseHandler validAddress(address) {
    if (address.length < 3) {
      return new ResponseHandler(false, 'Address should be at least 3 letters');
    }
    return new ResponseHandler(true, '');
  }

  ResponseHandler validContactNumber(contactNumber) {
    if (contactNumber.length < 10) {
      return new ResponseHandler(false, 'Invalid contact number');
    }
    return new ResponseHandler(true, '');
  }

  ResponseHandler validEmail(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.length < 3) {
      return new ResponseHandler(false, 'Email should be at least 3 letters');
    } else if (!emailValid) {
      return new ResponseHandler(false, 'Email is invalid');
    }
    return new ResponseHandler(true, '');
  }

  ResponseHandler validPassword({password, verifyPassword}) {
    if (password.length < 6 || verifyPassword.length < 6) {
      return new ResponseHandler(
          false, 'Password should be at least 6 characters');
    } else if (password.toString().trim() != verifyPassword.toString().trim()) {
      return new ResponseHandler(false, 'Password do not match');
    }
    return new ResponseHandler(true, '');
  }
}
