import 'package:randomuser_flutter_app/redux/app_state.dart';

import 'package:randomuser_flutter_app/models/user.dart';

List<User> filteredUsersSelector(AppState state){
  var users = state.userState.users;
  var filters = state.userState.filters;

  var list = users
      .where((user) =>
        (filters.gender == null || user.gender == filters.gender)
        && (filters.age == null || user.dob.age <= filters.age)
        && (filters.nat == null || user.nat == filters.nat))
      .toList();
  return list;
}