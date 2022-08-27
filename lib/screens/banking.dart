import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class Banking extends StatefulWidget {
  @override
  _BankingState createState() => _BankingState();
}

class _BankingState extends State<Banking> {

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }

  String _name;
  String _dob;
  String _pob;
  String _status;
  String _dependents;
  String _children;
  String _nationality;
  String _father;
  String _mother;
  String _address;
  String _sName;
  String _city;
  String _district;
  String _state;
  String _occu;
  String _cost;
  String _down;
  String _down2;
  String _loan;
  String _repayment;
  String _loanFor;
  String _balance;
  String _exp;

  final List<String> status = ['Married', 'Unmarried'];
  final List<String> occu = ['Salaried','Businessman','Self-Employed Professional','Pensioner'];
  final List<String> rePay = ['Monthly','Quarterly','Annually Tenure'];
  final List<String> loanFor = ['New House Construction','Purchase of New House'
  'Purchase of Old House', 'Purchase of Plot of Land','Purchase of New Flat','Purchase of Resale Flat','Repairs and Renovation','Home Extension'];

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
                Center(child: Text('Banking and Financing',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.01,),
                Center(child: Text('We provide our clients with easy and hassle free banking and financing services for buying or constructing new properties. We provide these services in several places around the country.',style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.justify,)),
                SizedBox(height: h*0.01,),
                Center(child: Text('Loan Form',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
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
                    icon: Icon(Icons.date_range),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Date of Birth',
                  ),
                  onChanged: (value){
                    setState(() {
                      _dob = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    icon: Icon(Icons.location_on),
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Place of Birth',
                  ),
                  onChanged: (value){
                    setState(() {
                      _pob = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Martial Status',
                  ),
                  value: _status,
                  items: status.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text('$status'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _status = val;
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
                    icon: Icon(Icons.people),
                    hintText: 'No. of Dependents',
                  ),
                  onChanged: (value){
                    setState(() {
                      _dependents = value;
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
                    icon: Icon(Icons.face),
                    hintText: 'No. of Children',
                  ),
                  onChanged: (value){
                    setState(() {
                      _children = value;
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
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.person),
                    hintText: "Father's Name",
                  ),
                  onChanged: (value){
                    setState(() {
                      _father = value;
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
                    hintText: "Mother's Maidan Name",
                  ),
                  onChanged: (value){
                    setState(() {
                      _mother = value;
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.home),
                    hintText: 'Permanent Address',
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
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.location_on),
                    hintText: 'Street Name',
                  ),
                  onChanged: (value){
                    setState(() {
                      _sName = value;
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
                    icon: Icon(Icons.map),
                    hintText: 'District',
                  ),
                  onChanged: (value){
                    setState(() {
                      _district = value;
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
                    hintText: 'State',
                  ),
                  onChanged: (value){
                    setState(() {
                      _state = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nature of Occupation',
                  ),
                  value: _occu,
                  items: occu.map((occu) {
                    return DropdownMenuItem(
                      value: occu,
                      child: Text('$occu'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _occu = val;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                Center(child: Text('Loan Details',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Cost of property',
                  ),
                  onChanged: (value){
                    setState(() {
                      _cost = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Down payment',
                  ),
                  onChanged: (value){
                    setState(() {
                      _down = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.schedule),
                    hintText: 'Down payment %',
                  ),
                  onChanged: (value){
                    setState(() {
                      _down2 = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.attach_money),
                    hintText: 'Loan Amount',
                  ),
                  onChanged: (value){
                    setState(() {
                      _loan = value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Repayment',
                  ),
                  value: _repayment,
                  items: rePay.map((rePay) {
                    return DropdownMenuItem(
                      value: rePay,
                      child: Text('$rePay'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _repayment = val;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Loan for',
                  ),
                  value: _loanFor,
                  items: loanFor.map((loanFor) {
                    return DropdownMenuItem(
                      value: loanFor,
                      child: Text('$loanFor'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _loanFor = val;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.account_balance),
                    hintText: 'Balance Transfer from another Bank',
                  ),
                  onChanged: (value){
                    setState(() {
                      _balance= value;
                    });
                  },
                ),
                SizedBox(height: h*0.02,),TextFormField(
                  validator: _validateName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0),
                    icon: Icon(Icons.date_range),
                    hintText: 'Reimbursement of expenditure incurred in past 12 months',
                  ),
                  onChanged: (value){
                    setState(() {
                      _exp = value;
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
                        await DatabaseService().updateBankingData(_name, _dob, _pob, _status, _dependents, _children, _nationality, _father, _mother, _address, _sName, _city, _district, _state, _occu, _cost, _down, _down2, _loan, _repayment, _loanFor, _balance, _exp, _date);
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
