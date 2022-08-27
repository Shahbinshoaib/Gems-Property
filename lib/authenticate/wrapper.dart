import 'package:flutter/material.dart';
import 'package:gemsproperty/authenticate/authenticate.dart';
import 'package:gemsproperty/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:gemsproperty/services/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    // return either home or authenticate
    if (user == null){
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}
