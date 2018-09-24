import 'user_actions.dart';

import 'package:redux/redux.dart';

import 'package:randomuser_flutter_app/redux/user_state.dart';


final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, FetchUsersAction>(_requestingUsers),
  TypedReducer<UserState, ReceivedUsersAction>(_receivedUsers),
  TypedReducer<UserState, ApplyFiltersAction>(_applyFilters),
]);

UserState _requestingUsers(UserState state, FetchUsersAction action){
  return state.copyWith();
}

UserState _receivedUsers(UserState state, ReceivedUsersAction action){
  return state.copyWith(users: action.users);
}

UserState _applyFilters(UserState state, ApplyFiltersAction action){
  var list = state.users
    .where((user) =>
      (action.filters.gender == null || user.gender == action.filters.gender)
      && (action.filters.age == null || user.dob.age <= action.filters.age)
      && (action.filters.nat == null || user.nat == action.filters.nat))
    .toList();
  return state.copyWith(filters: action.filters, filteredUsers: list);
}