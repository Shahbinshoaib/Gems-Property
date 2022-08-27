import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:intl/intl.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class BuyersForm extends StatefulWidget {
  @override
  _BuyersFormState createState() => _BuyersFormState();
}

class _BuyersFormState extends State<BuyersForm> {

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }

  String _name;
  String _email;
  String _phone;
  String _type;
  String _address;
  String _budget;

  final List<String> type = ['Land', 'House','Commercial','Lease'];

  final AuthService _auth = AuthService();
  String gError = '';
  String error = '';

  Widget _buildLoginBtn() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
          width: MediaQuery.of(context).size.width*0.6,
          child: GoogleSignInButton(
            splashColor: Colors.indigo,
            onPressed: () async {
              dynamic result = await _auth.signInWithGoogle();
              Navigator.of(context).pop();
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
  bool loader = false;

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          // **Note**: if got "ERR_CLEARTEXT_NOT_PERMITTED", modify
          // AndroidManifest.xml.
          // Cf. https://github.com/flutter/flutter/issues/30368#issuecomment-480300618
          builder: (ctx) => WebviewScaffold(
            initialChild: Center(child: CircularProgressIndicator()),
            url: url,
            appBar: AppBar(),
          ),
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('URL $url can not be launched.'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog2() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('THANK YOU',style: TextStyle(color: Colors.red[700]),)),
          );
        },
      );
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';


    final user = Provider.of<User>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Future<void> _showlogin() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Sign In to Continue')),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                      height: h*0.1,
                      width: w*0.5,
                      child: _buildLoginBtn()),
                ],
              ),
            ),
          );
        },
      );
    }


    return loader ? Loader() : SingleChildScrollView(
      child: Container( decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.blue[300],
                Colors.white,
              ])
      ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  onPressed: () async{
                    FocusScope.of(context).requestFocus(FocusNode());
                    this._openInWebview('https://drive.google.com/file/d/1Q23PqvCommZtUtcTljg2RnDMCnALhbhx/view?usp=sharing');
                  },
                  color: Colors.indigo,
                  child: Text('Download Buyers PDF Form',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: h*0.01,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    filled: true,
                    icon: Icon(Icons.person),
                  ),
                  onChanged: (value){
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.email),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Email',
                  ),
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.phone),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Phone',
                  ),
                  onChanged: (value){
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Property Type',
                  ),
                  value: _type,
                  items: type.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text('$type'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _type = val;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.home),
                    hintText: 'Preferred Address',
                  ),
                  onChanged: (value){
                    setState(() {
                      _address = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Preferred Budget',
                  ),
                  onChanged: (value){
                    setState(() {
                      _budget = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                ButtonTheme(
                  height: 40.0,
                  child: RaisedButton(
                    splashColor: Colors.indigo,
                    color: Colors.orange,
                    child: Text('SUBMIT',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    elevation: 5.0,
                    onPressed: loader ? null : () async {
                      if(_formkey.currentState.validate()){
                        if(user == null){
                        _showlogin();
                        }else{
                        setState(() {
                          loader = true;
                        });
                        await DatabaseService().updateBuyerForm(_name, _email, _phone, _type, _address, _budget, _date);
                        Navigator.pop(context);
                        setState(() {
                          loader = false;
                          _showMyDialog2();
                        });
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: h*0.28,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
