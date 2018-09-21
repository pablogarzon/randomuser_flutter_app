import 'package:randomuser_flutter_app/models/user.dart';

class UserState {
  final User user;
  final List<User> users;
  final List<User> filteredUsers;

  const UserState({this.user, this.users, this.filteredUsers});

  factory UserState.initial(){
    return UserState(
      user: User(),
      users: [],
    );
  }

  UserState copyWith({
    User user,
    List<User> users,
    List<User> filteredUsers
  }){
    return UserState(
      user: user ?? this.user,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers
    );
  }
}