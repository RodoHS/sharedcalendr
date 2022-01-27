import 'package:flutter/foundation.dart';
import 'package:sharedcalendr/types/user_type.dart';
import 'package:sharedcalendr/utils/functions.dart';

class AuthModel extends ChangeNotifier {
  // consts and variables
  bool _isBootLoading = false;
  UserType _user = UserType();

  // Getters
  // UserType get user => _user;
  bool get isBootLoading => _isBootLoading;
  UserType get user => _user;
  // DatabaseService get dbService => _dbService;
  // StorageService get storageService => _storageService;
  // AuthenticationService get authService => _authService;

  AuthModel() {
    // _startListeners();
  }

  @override
  void dispose() {
    Functions.printMsg('AuthModel', 'dispose');
    super.dispose();
  }

  // Setters
  void setIsBootLoading(bool value) {
    Functions.printMsg(
        'AuthModel', 'setIsBootLoading', 'boot loading is $value');
    _isBootLoading = value;
    notifyListeners();
  }

    void setUser(UserType value) {
    Functions.printMsg(
        'AuthModel', 'setUser');
    _user = value;
    notifyListeners();
  }
}
