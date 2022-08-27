import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:intl/intl.dart';


class AddAgent extends StatefulWidget {
  @override
  _AddAgentState createState() => _AddAgentState();
}

class _AddAgentState extends State<AddAgent> {

  final _formkey = GlobalKey<FormState>();
  bool loader = false;

  String _name;
  String _designation;
  String _area;
  String _email;
  String _phone;
  String _pic;


  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('AGENT ADDED SUCCESSFULLY',style: TextStyle(color: Colors.orange),)),
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
        title: Text('Add a new member'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val){
                        setState(() {
                          _name = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _designation = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Designation',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _area = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Area',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      onChanged: (val){
                        setState(() {
                          _pic = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Picture url',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    TextFormField(
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
                      validator: (val) => val.isEmpty ? 'Required' : null,
                      onChanged: (val){
                        setState(() {
                        _phone = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('ADD', style: TextStyle(color: Colors.red),),
            onPressed: ()async {
              if (_formkey.currentState.validate()){
                setState(() {
                  loader = true;
                });
                await DatabaseService().updateAgent(_name, _designation, _area, _email, _phone,_pic,_date);
                Navigator.pop(context);
                setState(() {
                  loader = false;
                });
              }
            },
          ),
        ],
      ),
    );

  }
}


