import 'dart:io';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:gemsproperty/database.dart';
import 'package:intl/intl.dart';


class AgentForm extends StatefulWidget {
  @override
  _AgentFormState createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }

  String _name;
  String _email;
  String _fatherName;
  String _gFatherName;
  String _address;
  String _city;
  String _state;
  String _vdc;
  String _address2;
  String _city2;
  String _state2;
  String _vdc2;
  String _nationality;
  String _dob;
  String _pob;
  String _identityType;
  String _identityNo;
  String _idate;
  String _qualification;
  String _language;
  String _phone;
  String _landline;
  String _email2;
  String _phone3;
  String _landline3;
  String _email3;
  String _bank;
  String _accNo;
  String _accName;
  String _message;

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

    final user = Provider.of<User>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';


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
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
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
                  validator: _validateName,
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
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: "Father's Name",
                  ),
                  onChanged: (value){
                    setState(() {
                      _fatherName = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.person),
                    hintText: "Grand Father's Name",
                  ),
                  onChanged: (value){
                    setState(() {
                      _gFatherName = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Temporary Address',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.home),
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
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'City',
                  ),
                  onChanged: (value){
                    setState(() {
                      _city = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'State',
                  ),
                  onChanged: (value){
                    setState(() {
                      _state = value;
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
                    icon: Icon(Icons.location_on),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'VDC / Municipality',
                  ),
                  onChanged: (value){
                    setState(() {
                      _vdc = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Permanent Address',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.home),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: "Address",
                  ),
                  onChanged: (value){
                    setState(() {
                      _address2 = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: "City",
                  ),
                  onChanged: (value){
                    setState(() {
                      _city2 = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'State',
                  ),
                  onChanged: (value){
                    setState(() {
                      _state2 = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'VDC / Municipality',
                  ),
                  onChanged: (value){
                    setState(() {
                      _vdc2 = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.flag),
                    hintText: 'Nationality',
                  ),
                  onChanged: (value){
                    setState(() {
                      _nationality = value;
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
                    icon: Icon(Icons.calendar_today),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: "Date of Birth",
                  ),
                  onChanged: (value){
                    setState(() {
                      _dob = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.map),
                    hintText: "Place of Birth",
                  ),
                  onChanged: (value){
                    setState(() {
                      _pob = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.contact_phone),
                    hintText: 'Type of Identity',
                  ),
                  onChanged: (value){
                    setState(() {
                      _identityType = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.contact_phone),
                    hintText: 'Identity Number',
                  ),
                  onChanged: (value){
                    setState(() {
                      _identityNo = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.date_range),
                    hintText: 'Issued Date',
                  ),
                  onChanged: (value){
                    setState(() {
                      _idate = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.school),
                    hintText: 'Academic Qualification',
                  ),
                  onChanged: (value){
                    setState(() {
                      _qualification = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.language),
                    hintText: 'Language',
                  ),
                  onChanged: (value){
                    setState(() {
                      _language = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Primary Contact',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.phone_android),
                    hintText: 'Mobile No.',
                  ),
                  onChanged: (value){
                    setState(() {
                      _phone = value;
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
                    icon: Icon(Icons.call),
                    hintText: 'Landline No.',
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
                  textCapitalization: TextCapitalization.sentences,
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
                      _email2 = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Secondary Contact',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.phone_android),
                    hintText: 'Mobile No.',
                  ),
                  onChanged: (value){
                    setState(() {
                      _phone3 = value;
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
                    icon: Icon(Icons.call),
                    hintText: 'Landline No.',
                  ),
                  onChanged: (value){
                    setState(() {
                      _landline3 = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.sentences,
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
                      _email3 = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Bank Details',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.monetization_on),
                    hintText: 'Bank Name',
                  ),
                  onChanged: (value){
                    setState(() {
                      _bank = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.confirmation_number),
                    hintText: 'Account No.',
                  ),
                  onChanged: (value){
                    setState(() {
                      _accNo = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.confirmation_number),
                    hintText: 'Account Name',
                  ),
                  onChanged: (value){
                    setState(() {
                      _accName = value;
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
                    icon: Icon(Icons.message),
                    hintText: 'Your Message',
                  ),
                  onChanged: (value){
                    setState(() {
                      _message = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('SELF DECLARATION',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                Center(child: Text('1. I agree that all my details (name, date of birth and address) match those on my current'
                  'ID/passport.'
                  '\n\n2. I confirm that I will be working with Gems property services according to their terms and'
                  'conditions and will work accordingly.'
                  '\n\n3. I confirm that I will be working as an agent as per rules of Gems property services.'
                  '\n\n4. I confirm that I will never violate rules and regulation of Gems property services.'
                  '\n\n5. I further confirm that I will be working as a mediator but the sole ownership will be of Gems'
                  'property services.'
                  '\n\n6. I confirm that all the financial transaction will be submitted to Gems Group services.'
                  '\n\n7. I confirm that if I violate any rules and regulations, Gems property service may take legal actions'
                  'against me.',style: TextStyle(fontSize: 18.0,),textAlign: TextAlign.justify,)),
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
                        }else {
                          setState(() {
                            loader = true;
                          });
                          await DatabaseService().updateAgentRequestForm(_name, _email, _fatherName, _gFatherName, _address, _city, _state, _vdc, _address2, _city2, _state2, _vdc2, _nationality, _dob, _pob, _identityType, _identityNo, _idate, _qualification, _language, _phone, _landline, _email2, _phone3, _landline3, _email3, _bank, _accNo, _accName, _message,_date);
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
