import 'package:randomuser_flutter_app/models/user.dart';

class FetchUsersAction {}

class ReceivedUsersAction {
  final List<User> users;
  ReceivedUsersAction({this.users});
}