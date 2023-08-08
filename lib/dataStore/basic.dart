import 'package:flutter/material.dart';

class BasicModel extends ChangeNotifier {
  dynamic _token = "";
  dynamic _userId = '0';
  bool _isLogIn = false;
  String _userType = "user";
  dynamic _email = "";
  dynamic _name = "";
  dynamic _phoneNumber = "";
  dynamic _profileImage = "";
  dynamic _address = "";

  int getUserId() {
    return _userId;
  }

  void setTokenAndLoginFlag(
      dynamic userId, dynamic token, bool isLogIn, String email) {
    _userId = userId;
    _token = token;
    _isLogIn = isLogIn;
    _email = email;
    notifyListeners();
  }

  void setUserDetails(
    dynamic userId,
    dynamic name,
    dynamic phoneNumber,
    dynamic profileImage,
    dynamic address,
    dynamic email,
    bool isLogIn,
  ) {
    _userId = userId;
    _name = name;
    _phoneNumber = phoneNumber;
    _profileImage = profileImage;
    _address = address;
    _isLogIn = isLogIn;
    email = email;
    notifyListeners();
  }

  dynamic getToken() {
    return _token;
  }

  bool isUserLogedIn() {
    return _isLogIn;
  }

  String getUserType() {
    return _userType;
  }

  dynamic getUserDetails() {
    print(_userId);
    print(_token);
    print(_address);
    print(_email);
    print(_isLogIn);
    print(_name);
    print(_phoneNumber);
    print(_profileImage);
    print(_userType);

    return {
      _userId,
      _token,
      _address,
      _email,
      _isLogIn,
      _name,
      _phoneNumber,
      _profileImage,
      _userType,
    };
  }
}
