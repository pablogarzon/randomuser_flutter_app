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
  var us = users
      .where((user) =>
  action.filters.gender == null || user.gender == action.filters.gender)
      .where((user) => user.dob.age <= action.filters.age)
      .where((user) =>
  action.filters.nationality == null || user.nat == action.filters.nationality)
      .toList();
  return us;
}