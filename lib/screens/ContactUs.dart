import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:intl/intl.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:provider/provider.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }
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

  String _name;
  String _email;
  String _message;
  String _phone;
  bool loader = false;
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

  @override
  Widget build(BuildContext context) {

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


    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';

    return loader ? Loader() : SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.blue[300],
                  Colors.white,
                ])
        ),
        child:  Padding(
            padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h*0.02,),
                ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(child: Image.asset('assets/map.png',fit: BoxFit.fill,),onPressed: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    this._openInWebview('https://goo.gl/maps/gYR9BtWKkCiqbD6A6');
                  },),
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Gems Property Services',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                ListTile(
                  leading: Icon(Icons.location_on,size: h*0.04,color: Colors.indigo,),
                  title: Text('Putalisadak, Kathmandu, Nepal',style: TextStyle(fontSize: h*0.02),),
                ),
                SizedBox(height: h*0.02,),
                ListTile(
                  leading: Icon(Icons.phone_android,size: h*0.04,color: Colors.indigo,),
                  title: Text(' +9779818901126, +9779813327192',style: TextStyle(fontSize: h*0.02),),
                ),
                SizedBox(height: h*0.02,),
                ListTile(
                  leading: Icon(Icons.phone_android,size: h*0.04,color: Colors.indigo,),
                  title: Text(' +9779802324449, +9779851056734',style: TextStyle(fontSize: h*0.02),),
                ),
                SizedBox(height: h*0.02,),
                ListTile(
                  leading: Icon(Icons.email,size: h*0.04,color: Colors.indigo,),
                  title: Text(' info@gemspropertyservices.com',style: TextStyle(fontSize: h*0.02),),
                ),
                SizedBox(height: h*0.02,),
                ListTile(
                  leading: Icon(Icons.language,size: h*0.04,color: Colors.indigo,),
                  title: Text(' www.gemspropertyservices.com',style: TextStyle(fontSize: h*0.02),),
                ),
                SizedBox(height: h*0.02,),
                Center(child: Text('Contact Form',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.person),
                    hintText: 'Full Name',
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.email),
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
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.message),
                    hintText: 'Message',
                  ),
                  onChanged: (value){
                    setState(() {
                      _message = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                ButtonTheme(
                  height: 40.0,
                  minWidth: w*0.95,
                  child: RaisedButton(
                    splashColor: Colors.indigo,
                    color: Colors.orange,
                    child: Text('SUBMIT',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    elevation: 5.0,
                    onPressed: loader ? null : () async {
                      if(user == null){
                      _showlogin();
                      }else {
                        setState(() {
                          loader = true;
                        });
                        await DatabaseService().updateContact(
                            _name, _email, _message, _date, _phone);
                        Navigator.pop(context);
                        setState(() {
                          loader = false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: h*0.02,),
              ],
            )
        ),
      ),
    );
  }
}
