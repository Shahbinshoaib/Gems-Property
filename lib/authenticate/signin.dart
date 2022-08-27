import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services//loader.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loader = false;
  bool _showPassword = false;
  String email = '';
  String password = '';
  String error = '';
  String gError = '';


  Widget _buildLoginBtn() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
          width: MediaQuery.of(context).size.width*0.6,
          child: GoogleSignInButton(
            splashColor: Colors.orange,
            onPressed: () async {
              setState(() {
                loader = true;
              });
              dynamic result = await _auth.signInWithGoogle();
              if (result == null){
                setState(() {
                  gError = 'Could Not Sign In With Google';
                  loader = false;
                });
              } else{

              }
            },
            // darkMode: true, // default: false
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          error,
          style: TextStyle(color: Colors.red, fontSize: 14.0),
        ),
      ],
    );
  }




  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return loader ? Loader() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          color: Colors.white,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: h*0.1447,),
              Image.asset('assets/logo.png',height: h*0.20,),
              SizedBox(height: h*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign In',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: h*0.05),),
              ),
              SizedBox(height: h*0.05,),
              _buildLoginBtn(),
              SizedBox(height: h*0.05,),
              Image.asset('assets/red.jpg',width: w,),
            ],
          ),
        ),
      ),
    );
  }
}
