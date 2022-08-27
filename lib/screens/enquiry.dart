import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:intl/intl.dart';

class Enquiry extends StatefulWidget {
  @override
  _EnquiryState createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {

  final _formkey = GlobalKey<FormState>();
  bool loader = false;

  String _name;
  String _email;
  String _phone;
  String _message;

  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Your message was sent successfully. THANK YOU',style: TextStyle(color: Colors.orange),textAlign: TextAlign.center,)),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';


    return loader ? Loader() : SingleChildScrollView(
      child: AlertDialog(
        title: Text('ENQUIRY'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Your Name' : null,
                      onChanged: (val){
                        setState(() {
                          _name = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _email = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _phone = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.streetAddress,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _message = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Message',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('CANCEL',style: TextStyle(color: Colors.blue),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('SUBMIT', style: TextStyle(color: Colors.orange),),
            onPressed: ()async {
              if (_formkey.currentState.validate()){
                setState(() {
                  loader = true;
                });
                await DatabaseService().updateContact(_name, _email, _message, _date,_phone);
                Navigator.pop(context);
                setState(() {
                  loader = false;
                  _showMyDialog2();
                });
              }
            },
          ),
        ],
      ),
    );;
  }
}
