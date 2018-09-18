import 'app_state.dart';

import 'user_reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    users: usersReducer(state.users, action)
  );
}