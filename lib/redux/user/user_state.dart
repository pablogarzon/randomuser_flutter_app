import 'package:randomuser_flutter_app/models/user.dart';
import 'package:randomuser_flutter_app/models/user_filters.dart';

class UserState {
  final User user;
  final List<User> users;
  final UserFilters filters;

  const UserState({
    this.user,
    this.users,
    this.filters,
  });

  factory UserState.initial(){
    return UserState(
      user: User(),
      filters: UserFilters(),
      users: [],
    );
  }

  UserState copyWith({
    User user,
    List<User> users,
    UserFilters filters
  }){
    return UserState(
      user: user ?? this.user,
      users: users ?? this.users,
      filters: filters ?? this.filters,
    );
  }
}