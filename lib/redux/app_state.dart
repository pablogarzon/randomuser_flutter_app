import 'user_state.dart';

class AppState {
  final UserState userState;

  const AppState({this.userState});

  factory AppState.initial(){
    return AppState(
      userState: UserState.initial()
    );
  }
}