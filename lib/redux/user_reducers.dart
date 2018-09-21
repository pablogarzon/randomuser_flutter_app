import 'user_actions.dart';

import 'package:randomuser_flutter_app/models/user.dart';

List<User> usersReducer(List<User> users, action) {
  if(action is ReceivedUsersAction) {
    return action.users;
  } else if(action is ApplyFiltersAction) {
    return applyFilterReducer(users, action);
  } else {
    return [];
  }
}

List<User> applyFilterReducer(List<User> users, ApplyFiltersAction action){
  return users
    .where((user) =>
      action.filters.gender == null || user.gender == action.filters.gender)
    .where((user) => action.filters.age == null || user.dob.age <= action.filters.age)
    .where((user) =>
      action.filters.nat == null || user.nat == action.filters.nat)
    .toList();
}