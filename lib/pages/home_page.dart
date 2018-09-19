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
        actions: <Widget>[
          StoreConnector(
              converter: (Store<AppState> store) => () => store.dispatch(FetchUsersAction()),
              builder: (BuildContext context, VoidCallback callback){
                return IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: callback
                );
              }
          ),
        ],
      ),
      body: StoreBuilder(
        onInit: (store) =>  store.dispatch(FetchUsersAction()),
        builder: (BuildContext context, Store<AppState> store) {
          return StoreConnector<AppState, _HomePageViewModel>(
            converter: (Store<AppState> store) => _HomePageViewModel.fromStore(store),
            builder: (BuildContext context, _HomePageViewModel vm){
              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Container(
                      margin: EdgeInsets.all(5.0),
                      height: 50.0,
                      width: 90.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(vm.users[index].picture.thumbnail),
                        ),
                        title: Center(
                          child: Text(vm.users[index].email),
                        ),
                      )
                  );
                },
                itemCount: vm.users.length,
              );
            },
          );
        }
      )
    );
  }
}

class _HomePageViewModel {
  final List<User> users;

  _HomePageViewModel({this.users});

  factory _HomePageViewModel.fromStore(Store<AppState> store) {
    return _HomePageViewModel(
        users: store.state.users
    );
  }

}
