import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:randomuser_flutter_app/redux/app_state.dart';
import 'package:randomuser_flutter_app/redux/user_actions.dart';

import 'package:randomuser_flutter_app/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: StoreConnector<AppState, _HomePageViewModel>(
        converter: (Store<AppState> store) => _HomePageViewModel.fromStore(store),
        builder: (BuildContext context, _HomePageViewModel vm){
          vm.refreshEvents();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return Container(
                margin: EdgeInsets.all(5.0),
                height: 50.0,
                width: 90.0,
                child: Center(
                  child: Text("Hi!"),
                )
              );
            },
            itemCount: vm.users.length,
          );
        },
      ),
    );
  }
}

class _HomePageViewModel {
  final List<User> users;
  final Function refreshEvents;

  _HomePageViewModel({this.users, this.refreshEvents});

  factory _HomePageViewModel.fromStore(Store<AppState> store) {
    return _HomePageViewModel(
        users: store.state.users,
        refreshEvents: () => store.dispatch(FetchUsersAction())
    );
  }

}
