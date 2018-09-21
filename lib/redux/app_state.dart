import 'package:randomuser_flutter_app/models/user.dart';

class AppState {
  final User user;
  final List<User> users;
  final List<User> filteredUsers;

  const AppState({this.user, this.users, this.filteredUsers});

  factory AppState.initial(){
    return AppState(
      user: User(),
      users: [],
    );
  }
}