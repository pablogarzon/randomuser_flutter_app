import 'package:redux/redux.dart';

import 'user_state.dart';
import 'user_actions.dart';

import 'package:randomuser_flutter_app/models/user_filters.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, FetchUsersAction>(_requestingUsers),
  TypedReducer<UserState, ReceivedUsersAction>(_receivedUsers),
  TypedReducer<UserState, ApplyFiltersAction>(_applyFilters),
]);

UserState _requestingUsers(UserState state, FetchUsersAction action){
  return state.copyWith();
}

UserState _receivedUsers(UserState state, ReceivedUsersAction action){
  return state.copyWith(users: action.users, filters: UserFilters());
}

UserState _applyFilters(UserState state, ApplyFiltersAction action){
  return state.copyWith(filters: action.filters);
}