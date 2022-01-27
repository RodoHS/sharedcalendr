import 'package:flutter/foundation.dart';
import 'package:sharedcalendr/models/auth_model.dart';
import 'package:sharedcalendr/utils/functions.dart';

class MainModel extends ChangeNotifier {
  late AuthModel _authModel;

  MainModel(this._authModel) {
    // _startListeners();
  }

  void update(AuthModel authModel) {
    _authModel = authModel;
    Functions.printMsg('AuthModel', 'update');
    notifyListeners();
  }
}
