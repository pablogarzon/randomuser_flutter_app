import 'user_actions.dart';

import 'package:randomuser_flutter_app/models/user.dart';

List<User> usersReducer(List<User> persons, action) {
  if(action is ReceivedUsersAction){
    return action.users;
  } else {
    return [];
  }
}