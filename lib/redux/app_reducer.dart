import 'app_state.dart';
import 'user/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userState: userReducer(state.userState, action),
  );
}