import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<User> users;

  Future getContacts() async {
    setState(ViewState.Busy);
    users = await _api.getContactsList();

    print('In user list');
    print(users);

    setState(ViewState.Idle);
  }
}