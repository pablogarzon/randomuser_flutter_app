import 'package:randomuser_flutter_app/models/user.dart';
import 'package:randomuser_flutter_app/models/user_filters.dart';

class FetchUsersAction {}

class ReceivedUsersAction {
  final List<User> users;
  ReceivedUsersAction({this.users});
}

class ApplyFiltersAction {
  final UserFilters filters;
  ApplyFiltersAction(this.filters);
}