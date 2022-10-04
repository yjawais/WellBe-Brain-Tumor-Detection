import 'package:major_proj_sbj/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    uid: '',
    username: '',
    email: '',
    phone: '',
    // address: '',
    // type: '',
    // token: '',
    // cart: [],
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(UserModel user){
    _user=user;
    notifyListeners();
  }
}
