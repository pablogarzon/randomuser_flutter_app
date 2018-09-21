import 'app_state.dart';

import 'user_reducers.dart';

AppState appReducer(AppState state, action) {
  var s = AppState(
    users: usersReducer(state.users, action),
    filteredUsers: usersReducer(state.users, action)
  );
  return s;
}