import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:redux/redux.dart';

import 'app_state.dart';
import 'user_actions.dart';

import 'package:randomuser_flutter_app/models/user.dart';

class UserMiddleware extends MiddlewareClass<AppState> {

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async{
    next(action);

    if(action is FetchUsersAction){
      var users = <User>[];
      final response = await http.get('https://randomuser.me/api/?results=50', headers: {"Accept": "application/json"});
      if(response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var elem in data) {
          users.add(User.fromJson(elem));
        }
        store.dispatch(ReceivedUsersAction(users: users));
      } else {
        throw Exception('Failed to load data');
      }
    }
  }
}

