import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemsproperty/authenticate/loading.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gemsproperty/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Gems Property Service',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          splashColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
