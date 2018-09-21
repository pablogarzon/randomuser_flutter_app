import 'app_state.dart';

import 'user_reducer.dart';

AppState appReducer(AppState state, action) {
  var s = AppState(
    userState: userReducer(state.userState, action),
  );
  return s;
}