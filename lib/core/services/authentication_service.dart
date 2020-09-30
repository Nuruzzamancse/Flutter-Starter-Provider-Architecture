import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
    var fetchedUser = await _api.login(email, password);

    print('In fetched user section-----------------------------');
    print(fetchedUser);

    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}