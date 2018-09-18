import 'package:randomuser_flutter_app/models/user.dart';

class AppState {
  final User user;
  final List<User> users;

  const AppState({this.user, this.users});

  factory AppState.initial(){
    return AppState(
      user: User(),
      users: []
    );
  }
}