import 'dart:io';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:intl/intl.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class SellerForm extends StatefulWidget {
  @override
  _SellerFormState createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }

  String _name;
  String _address;
  String _mobile;
  String _landline;
  String _email;
  String _howSoon;
  String _liveIn;
  String _type;
  String _constructionType;
  String _type2;
  String _certificate;
  String _location;
  String _area;
  String _storey;
  String _other;
  String _area2;
  String _room;
  String _bathroom;
  String _roadSize;
  String _roadType;
  String _parking;
  String _price;
  String _totalPrice;
  String _reason;
  String _feature;
  String _name2;
  String _designation;
  bool loader = false;
  int _radioval1 = null;
  int _radioval2 = null;
  int _radioval3 = null;
  int _radioval4 = null;
  int _radioval5 = null;
  int _radioval6 = null;
  int _radioval7 = null;
  int _radioval8 = null;
  int _radioval9 = null;
  int _radioval10 = null;
  int _radioval11 = null;
  int _radioval12 = null;
  int _radioval13 = null;

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

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


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

    final user = Provider.of<User>(context);

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
                    this._openInWebview('https://drive.google.com/file/d/1vZ68kJogPQoch-MSGLC8t99CPFRIsnRE/view?usp=sharing');
                  },
                  color: Colors.indigo,
                  child: Text('Download Sellers PDF Form',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: h*0.02,),
                Center(child: Text('Personal Details',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Your Name',
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
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.home),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Address',
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
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.phone_android),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Mobile',
                  ),
                  onChanged: (value){
                    setState(() {
                     _mobile = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.call),
                    hintText: 'Landline',
                  ),
                  onChanged: (value){
                    setState(() {
                     _landline = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
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
                SizedBox(height: 30.0,),
                Text('How soon do you need to sell the property?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval1,
                        onChanged: (int value){
                          setState(() {
                            this._radioval1 = value;
                          });
                          if(_radioval1 == 0){
                            _howSoon = 'As soon as possible';
                          } else if(_radioval1 == 1) {
                            _howSoon = 'Within 1 month';
                          } else if(_radioval1 == 2){
                            _howSoon = 'Within 3 months';
                          } else{
                            _howSoon = 'i am looking options';
                          }
                          print(_howSoon);
                          },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('As soon as possible'),
                        SizedBox(height: 32.0,),
                        Text('Within 1 month'),
                        SizedBox(height: 32.0,),
                        Text('Within 3 months'),
                        SizedBox(height: 32.0,),
                        Text('I am looking options'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Do you currently live in the property?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval2,
                        onChanged: (int value){
                          setState(() {
                            this._radioval2 = value;
                          });
                          if(_radioval2 == 0){
                            _liveIn = 'Yes';
                          } else{
                            _liveIn = 'No';
                          }
                          print(_liveIn);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Yes'),
                        SizedBox(height: 33.0,),
                        Text('No'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Type of property you are selling?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval3,
                        onChanged: (int value){
                          setState(() {
                            this._radioval3 = value;
                          });
                          if(_radioval3 == 0){
                            _type = 'Commercial Area';
                          } else{
                            _type = 'Residential Area';
                          }
                          print(_type);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Commercial Area'),
                        SizedBox(height: 33.0,),
                        Text('Residential Area'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Type of Construction',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval4,
                        onChanged: (int value){
                          setState(() {
                            this._radioval4 = value;
                          });
                          if(_radioval4 == 0) {
                            _constructionType = 'Pillar System';
                          } else{
                            _constructionType = 'Wall System';
                          }
                          print(_constructionType);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pillar System'),
                        SizedBox(height: 33.0,),
                        Text('Wall System'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('What kind of property are you selling?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3,4]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval5,
                        onChanged: (int value){
                          setState(() {
                            this._radioval5 = value;
                          });
                          if(_radioval5 == 0){
                            _type2 = 'Land c Colony House';
                          } else if(_radioval5 == 1) {
                            _type2 = 'New Private House';
                          } else if(_radioval5 == 2){
                            _type2 = 'Private House 1-5 years old';
                          } else if(_radioval5 == 3){
                            _type2 = 'Private House 5-10 years old';
                          }else{
                            _type2 = 'Private House 10+ years old';
                          }
                          print(_type2);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Land c Colony House'),
                        SizedBox(height: 32.0,),
                        Text('New Private House'),
                        SizedBox(height: 32.0,),
                        Text('Private House 1-5 years old'),
                        SizedBox(height: 32.0,),
                        Text('Private House 5-10 years old'),
                        SizedBox(height: 32.0,),
                        Text('Private House 10+ years old'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Do you have Nirman Sampanna Certificate?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval6,
                        onChanged: (int value){
                          setState(() {
                            this._radioval6 = value;
                          });
                          if(_radioval6 == 0){
                            _certificate = 'Yes';
                          }else{
                            _certificate = 'No';
                          }
                          print(_certificate);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Yes'),
                        SizedBox(height: 33.0,),
                        Text('No'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'Location of Property',
                  ),
                  onChanged: (value){
                    setState(() {
                      _location = value;
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                Text('Land Area:',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3,4]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval7,
                        onChanged: (int value){
                          setState(() {
                            this._radioval7 = value;
                          });
                          if(_radioval7 == 0){
                            _area = '1-3 Aana';
                          } else if(_radioval7 == 1) {
                            _area = '4-6 Aana';
                          } else if(_radioval7 == 2){
                            _area = '6-10 Aana';
                          } else if(_radioval7 == 3){
                            _area = '10-16 Aana';
                          }else{
                            _area = '16+ Aana';
                          }
                          print(_area);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1-3 Aana'),
                        SizedBox(height: 32.0,),
                        Text('4-6 Aana'),
                        SizedBox(height: 32.0,),
                        Text('6-10 Aana'),
                        SizedBox(height: 32.0,),
                        Text('10-16 Aana'),
                        SizedBox(height: 32.0,),
                        Text('16+ Aana'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Built Storey:',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3,4]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval8,
                        onChanged: (int value){
                          setState(() {
                            this._radioval8 = value;
                          });
                          if(_radioval8 == 0){
                            _storey = '1-1.5';
                          } else if(_radioval8 == 1) {
                            _storey = '2-2.5';
                          } else if(_radioval8 == 2){
                            _storey = '3-3.5';
                          } else if(_radioval8 == 3){
                            _storey = '4-4.5';
                          }else{
                            _storey = '5+';
                          }
                          print(_storey);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1-1.5'),
                        SizedBox(height: 32.0,),
                        Text('2-2.5'),
                        SizedBox(height: 32.0,),
                        Text('3-3.5'),
                        SizedBox(height: 32.0,),
                        Text('4-4.5'),
                        SizedBox(height: 32.0,),
                        Text('5+'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.add),
                    hintText: 'Other',
                  ),
                  onChanged: (value){
                    setState(() {
                      _other = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.map),
                    hintText: 'Built up Area',
                  ),
                  onChanged: (value){
                    setState(() {
                      _area2 = value;
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                Text('No of rooms in each floor excluding bathroom',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3,4,5,6]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval9,
                        onChanged: (int value){
                          setState(() {
                            this._radioval9 = value;
                          });
                          if(_radioval9 == 0){
                            _room = '1';
                          } else if(_radioval9 == 1) {
                            _room = '2';
                          } else if(_radioval9 == 2){
                            _room = '3';
                          } else if(_radioval9 == 3){
                            _room = '4';
                          }else if(_radioval9 == 4) {
                            _room = '5';
                          } else if(_radioval9 == 5){
                            _room = '6';
                          }else{
                            _room = '7+';
                          }
                          print(_room);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1'),
                        SizedBox(height: 32.0,),
                        Text('2'),
                        SizedBox(height: 32.0,),
                        Text('3'),
                        SizedBox(height: 32.0,),
                        Text('4'),
                        SizedBox(height: 32.0,),
                        Text('5'),
                        SizedBox(height: 32.0,),
                        Text('6'),
                        SizedBox(height: 32.0,),
                        Text('7+'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('No of bathrooms in each floor',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval10,
                        onChanged: (int value){
                          setState(() {
                            this._radioval10 = value;
                          });
                          if(_radioval10 == 0){
                            _bathroom = '1';
                          }else if(_radioval10 == 1) {
                            _bathroom = '2';
                          } else if(_radioval10 == 2){
                            _bathroom = '3';
                          } else{
                            _bathroom = '4+';
                          }
                          print(_bathroom);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1'),
                        SizedBox(height: 32.0,),
                        Text('2'),
                        SizedBox(height: 32.0,),
                        Text('3'),
                        SizedBox(height: 32.0,),
                        Text('4+'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Road Size',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval11,
                        onChanged: (int value){
                          setState(() {
                            this._radioval11 = value;
                          });
                          if(_radioval11 == 0){
                            _roadSize = '6-8 ft.';
                          }else if(_radioval11 == 1) {
                            _roadSize = '8-12ft.';
                          } else if(_radioval11 == 2){
                            _roadSize = '12-16ft.';
                          } else{
                            _roadSize = '16ft+';
                          }
                          print(_roadSize);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('6-8 ft.'),
                        SizedBox(height: 32.0,),
                        Text('8-12 ft.'),
                        SizedBox(height: 32.0,),
                        Text('12-16 ft.'),
                        SizedBox(height: 32.0,),
                        Text('16 ft.+'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('Road type',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval12,
                        onChanged: (int value){
                          setState(() {
                            this._radioval12 = value;
                          });
                          if(_radioval12 == 0){
                            _roadType = 'Pitched';
                          } else if(_radioval12 == 1){
                            _roadType = 'Paved';
                          }else{
                            _roadType = 'Pebbled';
                          }
                          print(_roadType);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pitched'),
                        SizedBox(height: 32.0,),
                        Text('Paved'),
                        SizedBox(height: 32.0,),
                        Text('Pebbled'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text('How many car parking space do you have?',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [0,1,2,3,4]
                          .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioval13,
                        onChanged: (int value){
                          setState(() {
                            this._radioval13 = value;
                          });
                          if(_radioval13 == 0){
                            _parking = '0';
                          }else if(_radioval13 == 1) {
                            _parking = '1';
                          }else if(_radioval13 == 2) {
                            _parking = '2';
                          } else if(_radioval13 == 3){
                            _parking = '3';
                          } else{
                            _parking = '4+';
                          }
                          print(_parking);
                        },
                      )).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('0'),
                        SizedBox(height: 32.0,),
                        Text('1'),
                        SizedBox(height: 32.0,),
                        Text('2'),
                        SizedBox(height: 32.0,),
                        Text('3'),
                        SizedBox(height: 32.0,),
                        Text('4+'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Price of land per aana/dhur/kattha',
                  ),
                  onChanged: (value){
                    setState(() {
                      _price = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Total price in NPR (in lakhs)',
                  ),
                  onChanged: (value){
                    setState(() {
                      _totalPrice = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.question_answer),
                    hintText: 'Reason for selling?',
                  ),
                  onChanged: (value){
                    setState(() {
                      _reason = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.exposure_plus_1),
                    hintText: 'Any additional features of the property?',
                  ),
                  onChanged: (value){
                    setState(() {
                      _feature = value;
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
                            await DatabaseService().updateSellerFormData(_name, _address, _mobile, _landline, _email, _howSoon, _liveIn, _type, _constructionType, _type2, _certificate, _location, _area, _storey, _other, _area2, _room, _bathroom, _roadSize, _roadType, _parking, _price, _totalPrice, _reason, _feature, _name2, _designation, _date);
                            Navigator.pop(context);
                            setState(() {
                              loader = false;
                              _showMyDialog2();
                            });
                          }

                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
