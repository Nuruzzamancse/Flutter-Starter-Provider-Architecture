import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);

    var success = await _authenticationService.login(email, password);

    // Handle potential error here too.

    setState(ViewState.Idle);
    return success;
  }
}
