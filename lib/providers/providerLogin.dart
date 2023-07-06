import 'package:flutter/material.dart';
import 'package:musasy/model/modelLogin.dart';

class UserProvider with ChangeNotifier {
  List<ModelUser> _listUser = [
    ModelUser(
        username: 'yustinus', email: 'yustinus@gmail.com', password: 'yustinus')
  ];

  List<ModelUser> get allUser => _listUser;

  String _usernameUserLogin = '';
  String _emailUserLogin = '';
  String get usernameUserLogin => _usernameUserLogin;
  String get emailUserLogin => _emailUserLogin;

  void sedangLogin(username, email) {
    _usernameUserLogin = username;
    _emailUserLogin = email;
    notifyListeners();
  }

  ModelUser getUser(
    username,
    email,
  ) {
    return _listUser
        .firstWhere((user) => user.username == username && user.email == email);
  }

  void update(emailUser, usernameUser, ModelUser newData) {
    final index = _listUser.indexWhere(
        (user) => user.email == emailUser && user.username == usernameUser);
    if (index >= 0) {
      _listUser[index] = newData;
      notifyListeners();
    } else {
      throw Exception('User not found');
    }
    notifyListeners();
  }

  void register(ModelUser user) {
    _listUser.add(user);
    notifyListeners();
  }
}
