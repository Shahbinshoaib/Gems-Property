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


class Construction extends StatefulWidget {
  @override
  _ConstructionState createState() => _ConstructionState();
}

class _ConstructionState extends State<Construction> {

  final _formkey = GlobalKey<FormState>();
  String _validateName(String value) {
    if (value.isEmpty)
      return 'This is required';
  }

  String _page = 'Design';

  String _name;
  String _address;
  String _mobile;
  String _landline;
  String _email;
  String _landAddress;
  String _landArea;
  String _type;
  String _sfMax;
  String __sfMin;
  String _storey;
  String _room;
  String _bathroom;
  String _parking;
  String _stairs;
  String _roof;
  bool _pooja = false;
  bool _store= false;
  bool _underground = false;
  String _extra;
  String _additional;
  String _site;

  String _name2;
  String _address2;
  String _mobile2;
  String _landline2;
  String _email2;
  bool _newBuild= false;
  bool _extension= false;
  bool _renovation= false;
  String _location2;
  String _area2;
  String _storey2;
  String _budget;
  String _description;
  String _site2;

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



  final List<String> type = ['Commercial', 'Residential','Bungalow'];
  final List<String> storey = ['1','2','2.5','3','3.5'];
  final List<String> room = ['First Floor','Second Floor','Third Floor'];
  final List<String> stair = ['Indoor','Outdoor'];
  final List<String> roof = ['Flat','Sloop'];


  bool loader = false;



  @override
  Widget build(BuildContext context) {


    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    String _date = '$formattedDate - $currentTime';

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
        child: Column(
          children: [
            _page == 'Design' ? Padding(
              padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Design';
                            });
                          },
                          child: Text('Design',style: TextStyle(color: Colors.indigo),),
                          color: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Building';
                            });
                          },
                          child: Text('Building',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Legal';
                            });
                          },
                          child: Text('Legal work and registration',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Center(child: Text('We help  our clients to create designs for their new construction, alteration of old design and redevelopments. Our engineers and architects are employed to fulfill '
                        'both  practical and expressive requirements, and thus it serves both utilitarian and aesthetics ends.We have designed a wide range of projects including commercial, institutional and '
                        'residential. he practice is based on the belief that innovative yet practical design is essential for the production of good buildings, and that the best buildings spring from an open and enthusiastic collaboration between architect, client and consultants.'
                      '\n\n\nReady with you design and ready with your land? Yet, you might not be able to manage or build your dream house due to several reasons? Want to build your home without any hassle?'
                      '\n\nWe are pleased to tell you that we are here to help you build you your dream home in a fixed rate and yes according to your design and customization. It’s a full turnkey project for our client’s satisfaction.',style: TextStyle(fontSize: 18.0,),textAlign: TextAlign.justify,)),
                    SizedBox(height: h*0.03,),
                    Center(child: Text('Please fill the form below.',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                    SizedBox(height: h*0.02,),
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
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.call),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Landline',
                      ),
                      onChanged: (value){
                        setState(() {
                          _landline = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: h*0.02,),TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.location_on),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Land Address',
                      ),
                      onChanged: (value){
                        setState(() {
                          _landAddress = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.photo_size_select_small),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Land Area',
                      ),
                      onChanged: (value){
                        setState(() {
                          _landArea = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Type of project',
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
                        icon: Icon(Icons.crop_square),
                        hintText: 'Square footage Maximum',
                      ),
                      onChanged: (value){
                        setState(() {
                          _sfMax = value;
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
                        icon: Icon(Icons.crop_square),
                        hintText: 'Square Footage Minimum',
                      ),
                      onChanged: (value){
                        setState(() {
                          __sfMin = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Storey',
                      ),
                      value: _storey,
                      items: storey.map((storey) {
                        return DropdownMenuItem(
                          value: storey,
                          child: Text('$storey'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _storey = val;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Rooms Needed',
                      ),
                      value: _room,
                      items: room.map((room) {
                        return DropdownMenuItem(
                          value: room,
                          child: Text('$room'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _room = val;
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
                        icon: Icon(Icons.hot_tub),
                        hintText: 'Bathrooms Needed',
                      ),
                      onChanged: (value){
                        setState(() {
                          _bathroom = value;
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
                        icon: Icon(Icons.directions_car),
                        hintText: 'Parking',
                      ),
                      onChanged: (value){
                        setState(() {
                          _parking = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Stair',
                      ),
                      value: _stairs,
                      items: stair.map((stair) {
                        return DropdownMenuItem(
                          value: stair,
                          child: Text('$stair'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _stairs = val;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Roof Type',
                      ),
                      value: _roof,
                      items: roof.map((roof) {
                        return DropdownMenuItem(
                          value: roof,
                          child: Text('$roof'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _roof = val;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                        Checkbox(
                          value: _pooja,
                          onChanged: (bool value){
                            setState(() {
                              this._pooja = value;
                            });
                          },
                        ),
                        Text('Pooja Room'),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                        Checkbox(
                          value: _store,
                          onChanged: (bool value){
                            setState(() {
                              this._store = value;
                            });
                          },
                        ),
                        Text('Store Room'),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                        Checkbox(
                          value: _underground,
                          onChanged: (bool value){
                            setState(() {
                              this._underground = value;
                            });
                          },
                        ),
                        Text('Underground Rank'),
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
                        icon: Icon(Icons.plus_one),
                        hintText: 'Extra features needed',
                      ),
                      onChanged: (value){
                        setState(() {
                          _extra = value;
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
                        icon: Icon(Icons.playlist_add),
                        hintText: 'Additional Notes',
                      ),
                      onChanged: (value){
                        setState(() {
                          _additional = value;
                        });
                      },
                    ),
//                    SizedBox(height: h*0.02,),
//                    RaisedButton(
//                      child: Text('Upload Site Map | Foundation Map | Design',style: TextStyle(color: Colors.white),),
//                      onPressed: (){},
//                      color: Colors.indigo,
//                    ),
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
                            await DatabaseService().updateDesignData(_name, _address, _mobile, _landline, _email, _landAddress, _landArea, _type, _sfMax, __sfMin, _storey, _room, _bathroom, _parking, _stairs, _roof, _pooja.toString(), _store.toString(), _underground.toString(), _extra, _additional, _date);
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
            ) : Container(),
            _page == 'Building' ? Padding(
              padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Design';
                            });
                          },
                          child: Text('Design',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Building';
                            });
                          },
                          child: Text('Building',style: TextStyle(color: Colors.indigo),),
                          color: Colors.white,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Legal';
                            });
                          },
                          child: Text('Legal work and registration',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Center(child: Text('Home build by GEMS Property Services are the perfect blend of unique style and state-of-the-art craftsmanship. Enjoy the security, convenience and cost benefits of partnering with us. Our systems are all designed to minimize stress on your part'
                        ' by ensuring your new home stays within your budget and is built within the specified time frame. But more than anything our process aims to keep you informed, involved and delighted with both the build process and your new home.',style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.justify,)),
                    SizedBox(height: h*0.03,),
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
                          _name2 = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    TextFormField(
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
                          _address2 = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    TextFormField(
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
                          _mobile2 = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.call),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Landline',
                      ),
                      onChanged: (value){
                        setState(() {
                          _landline2 = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.email),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Email',
                      ),
                      onChanged: (value){
                        setState(() {
                          _email2 = value;
                        });
                      },
                    ),
                    SizedBox(height: h*0.02,),
                    Text('Service Required'),
                    Row(
                      children: [
                        Checkbox(
                          value: _newBuild,
                          onChanged: (bool value){
                            setState(() {
                              this._newBuild = value;
                            });
                          },
                        ),
                        Text('New Build'),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                        Checkbox(
                          value: _extension,
                          onChanged: (bool value){
                            setState(() {
                              this._extension = value;
                            });
                          },
                        ),
                        Text('Extension'),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Row(
                      children: [
                        Checkbox(
                          value: _renovation,
                          onChanged: (bool value){
                            setState(() {
                              this._renovation = value;
                            });
                          },
                        ),
                        Text('Renovation'),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    TextFormField(
                      validator: _validateName,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20.0),
                        icon: Icon(Icons.location_on),
                        hintText: 'Location of proposed development',
                      ),
                      onChanged: (value){
                        setState(() {
                          _location2 = value;
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
                        icon: Icon(Icons.crop_square),
                        hintText: 'Land Area',
                      ),
                      onChanged: (value){
                        setState(() {
                          _area2 = value;
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
                        icon: Icon(Icons.first_page),
                        hintText: "Storey",
                      ),
                      onChanged: (value){
                        setState(() {
                          _storey2 = value;
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
                        icon: Icon(Icons.monetization_on),
                        hintText: "Estimated budget",
                      ),
                      onChanged: (value){
                        setState(() {
                          _budget = value;
                        });
                      },
                    ),
                    SizedBox(height: 30.0,),
                    Text('Description of Work - Please give a brief written description of what you want to do, including what'
                      'materials you want to use then complete.'),
                    TextFormField(
                      validator: _validateName,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20.0),
                        icon: Icon(Icons.error),
                      ),
                      onChanged: (value){
                        setState(() {
                          _description = value;
                        });
                      },
                    ),
//                    SizedBox(height: h*0.02,),
//                    RaisedButton(
//                      child: Text('Upload Site Map | Foundation Map | Design',style: TextStyle(color: Colors.white),),
//                      onPressed: (){},
//                      color: Colors.indigo,
//                    ),
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
                            await DatabaseService().updateBuildingData(_name2, _address2, _mobile2, _landline2, _email2, _newBuild.toString(), _extension.toString(), _renovation.toString(), _location2, _area2, _storey2, _budget, _description, _date);
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
            ) : Container(),
            _page == 'Legal' ? Padding(
              padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
              child: Container(
                height: h,
                width: w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Design';
                            });
                          },
                          child: Text('Design',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Building';
                            });
                          },
                          child: Text('Building',style: TextStyle(color: Colors.white),),
                          color: Colors.indigo,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              _page = 'Legal';
                            });
                          },
                          child: Text('Legal work and registration',style: TextStyle(color: Colors.indigo),),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: h*0.02,),
                    Center(child: Text('In addition to providing designing and building service here in GEMS we help our clients in every steps form selling to buying , from land registration to '
                    'transfer and from legal paper works to building completion certificate registration. We are here providing all these services under a same roof.',style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.justify,)),
                ],
            ),
              )
          ) : Container(),
          ],
        ),
      ),
    );
  }
}
