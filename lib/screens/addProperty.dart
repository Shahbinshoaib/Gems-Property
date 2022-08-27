import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/loader.dart';


class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {

  final _formkey = GlobalKey<FormState>();
  bool loader = false;

  String _propertyType;
  String _propertyTitle;
  String _propertyArea;
  String _propertyPrice;
  String _propertyPic = null;
  String _propertyBeds;
  String _propertyDescription;
  String _propertyFacing;
  String _agentName;
  String _agentNo;
  String _category;
  String _propertyid;

  final List<String> category = [
    'BUY','RENT',
  ];
  final List<String> propertyType = [
    'House','Land','Commercial','Flat','Bungalow','Office','Apartment'
  ];
  final List<String> beds = [
    '1 bed','2 beds','3 beds','4 beds','5 beds',
  ];

  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('PROPERTY ADDED SUCCESSFULLY',style: TextStyle(color: Colors.orange),)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {



    return loader ? Loader() : SingleChildScrollView(
      child: AlertDialog(
        title: Text('Add a Property'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Property Category',
                      ),
                      value: _category,
                      items: category.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text('$category'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _category = val;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Property Type',
                      ),
                      value: _propertyType,
                      items: propertyType.map((cate) {
                        return DropdownMenuItem(
                          value: cate,
                          child: Text('$cate'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _propertyType = val;
                        });
                      },
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (val) => val.isEmpty ? 'Enter Title' : null,
                      onChanged: (val){
                        setState(() {
                          _propertyTitle = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Post Title',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) => val.isEmpty ? 'Enter Property Id' : null,
                      onChanged: (val){
                        setState(() {
                          _propertyid = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Property Id',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (val){
                        setState(() {
                          _propertyArea = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Property Area',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val){
                        setState(() {
                          _propertyPrice = val;
                        });
                      },
                      decoration: InputDecoration(
                        suffixText: 'Crore',
                        prefixText: 'Rs.',
                        labelText: 'Price /Rent',
                      ),
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (val){
                        setState(() {
                          _propertyPic = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Property Image url',
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'No. of Bedrooms',
                      ),
                      value: _propertyBeds,
                      items: beds.map((beds) {
                        return DropdownMenuItem(
                          value: beds,
                          child: Text('$beds'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _propertyBeds = val;
                        });
                      },
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (val){
                        setState(() {
                          _propertyDescription = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _propertyFacing = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'House Face',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                          _agentName = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Agent Name (If Any)',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: (val){
                        setState(() {
                           _agentNo = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Agent No. (If Any)',
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
            child: Text('POST', style: TextStyle(color: Colors.red),),
            onPressed: ()async {
              if (_formkey.currentState.validate()){
                setState(() {
                  loader = true;
                });
                if(_category == 'BUY'){
                  await DatabaseService().updateBuyPropertyData(_propertyType, _propertyTitle, _propertyArea, _propertyPrice, _propertyPic, _propertyBeds, _propertyDescription, _propertyFacing, _agentName, _agentNo,_propertyid);
                  Navigator.pop(context);
                }
                else{
                  await DatabaseService().updateRentPropertyData(_propertyType, _propertyTitle, _propertyArea, _propertyPrice, _propertyPic, _propertyBeds, _propertyDescription, _propertyFacing, _agentName, _agentNo,_propertyid);
                  Navigator.pop(context);
                }
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


