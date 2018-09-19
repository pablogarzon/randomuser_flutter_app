import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:randomuser_flutter_app/redux/app_state.dart';
import 'package:randomuser_flutter_app/redux/app_reducer.dart';
import 'package:randomuser_flutter_app/redux/user_middleware.dart';

import 'package:randomuser_flutter_app/pages/home_page.dart';

void main() => runApp(RandomUserApp());

class RandomUserApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [UserMiddleware()]
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Random user Flutter app',
        theme: ThemeData(
          primarySwatch: Colors.green
        ),
        home: HomePage(),
      ),
    );
  }
}
