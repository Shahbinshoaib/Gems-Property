import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemsproperty/screens/propertyBuyDetails.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gemsproperty/database.dart';

class PropertyListRent extends StatefulWidget {
  @override
  _PropertyListRentState createState() => _PropertyListRentState();
}

class _PropertyListRentState extends State<PropertyListRent> {


  bool loader = false;
  bool _filterUsed = false;
  bool _filterOn = false;
  String _fType;
  String _beds;
  final List<String> propertyType = [
    'HOUSE','LAND','COMMERCIAL','FLAT','BUNGALOW','OFFICE','APARTMENT'
  ];
  final List<String> beds = [
    '1 bed','2 beds','3 beds','4 beds','5 beds',
  ];
  RangeValues _currentRangeValues = RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {

    //final property = Provider.of<List<PropertyData>>(context) ?? [];
    final user = Provider.of<User>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;



    return StreamBuilder<List<PropertyData>>(
      stream: DatabaseService().rentPropertyData,
      builder: (context, snapshot){
        List<PropertyData> rentPropertyData = snapshot.data;
        if(snapshot.hasData){
          if(rentPropertyData.length != 0){
            final rentPropertyData2 = rentPropertyData.reversed;
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(20.0, h*0.02, 20.0,0),
                    child: ButtonTheme(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: (){
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(property: rentPropertyData),
                          );                        },
                        elevation: 5.0,
                        splashColor: Colors.indigo,
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: w*0.05,),
                            Text('Search',style: TextStyle(fontSize: 20.0),),
                            SizedBox(width: w*0.52,),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  _filterOn = !_filterOn;
                                  _filterUsed = true;
                                });                              },
                              icon: Icon(Icons.filter,color: Colors.indigo,),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  _filterOn ? Container(
                    color: Colors.transparent,
                    height: h*0.365,
                    width: w*0.95,
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListBody(
                              children: <Widget>[
                                SizedBox(height: h*0.01,),
                                Text('Filter',style: TextStyle(fontWeight: FontWeight.bold),),
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Select Property Category',
                                  ),
                                  value: _fType,
                                  items: propertyType.map((categor) {
                                    return DropdownMenuItem(
                                      value: categor,
                                      child: Text('${categor}'),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _fType = val;
                                      _filterUsed = true;
                                    });
                                  },
                                ),
                                DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'No. of Bedrooms'
                                  ),
                                  value: _beds,
                                  items: beds.map((beds) {
                                    return DropdownMenuItem(
                                      value: beds,
                                      child: Text('$beds'),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _beds = val;
                                      _filterUsed = true;
                                    });
                                  },
                                ),
                                SizedBox(height: h*0.04,),
                                Text('Price range'),
                                SizedBox(height: h*0.01,),
                                Center(
                                  child: RangeSlider(
                                    values: _currentRangeValues,
                                    min: 0,
                                    max: 10,
                                    divisions: 20,
                                    labels: RangeLabels(
                                      '${_currentRangeValues.start.toString()} Crore',
                                      '${_currentRangeValues.end.toString()} Crore',
                                    ),
                                    onChanged: (RangeValues values) {
                                      setState(() {
                                        _currentRangeValues = values;
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(
                                      child: Text('RESET',style: TextStyle(color: Colors.white),),
                                      color: Colors.indigo,
                                      onPressed: () {
                                        setState(() {
                                          _fType = null;
                                          _beds = null;
                                          _filterUsed = false;
                                          _filterOn = false;
                                          _currentRangeValues = RangeValues(0, 10);
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) : Container(),
                  Container(
                    height: h*0.9274,
                    width: w,
                    child: ListView.builder(
                      itemCount: rentPropertyData2.length,
                      itemBuilder: (context, index){
                        if(_filterUsed){
                          if(rentPropertyData2.toList()[index].type.toUpperCase() == _fType ||rentPropertyData2.toList()[index].bedrooms == _beds || (double.parse(rentPropertyData2.toList()[index].price) >= _currentRangeValues.start && double.parse(rentPropertyData2.toList()[index].price).toDouble() <= _currentRangeValues.end)) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: h*0.51,
                                    width: w,
                                    child: Card(
                                        elevation: 5.0,
                                        shape:  RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              child: Image.network(rentPropertyData2.toList()[index].pic ?? 'https://cdn.dribbble.com/users/3638706/screenshots/10188432/db2-01.jpg',height: h*0.35,fit: BoxFit.fill,),
                                              borderRadius: BorderRadius.circular(20.0)   ,),
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(rentPropertyData2.toList()[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: h*0.016,color: Colors.black),),
                                                      SizedBox(height: h*0.01,),
                                                      Text('Rent: Rs.${rentPropertyData2.toList()[index].price} Crore',style: TextStyle(fontSize: h*0.016,color: Colors.black45),),
                                                      SizedBox(height: h*0.01,),
                                                      Text(rentPropertyData2.toList()[index].type,style: TextStyle(fontSize: h*0.016,color: Colors.black45),),
                                                      SizedBox(height: h*0.01,),
                                                      Text('Property ID: ${rentPropertyData2.toList()[index].id}',style: TextStyle(fontSize: h*0.016,color: Colors.indigo),),
                                                    ],
                                                  ),
                                                  RaisedButton(
                                                    color: Colors.orange,
                                                    child: Text('View Details',style: TextStyle(color: Colors.white),) ,
                                                    onPressed: () {
                                                      setState(() {
                                                        loader = true;
                                                      });
                                                      Navigator.of(context).push(AdminPanel1(rentPropertyData2.toList()[index]));
                                                      setState(() {
                                                        loader = false;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          else{
                            return Container();
                          }
                        }else{
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: h*0.51,
                                  width: w,
                                  child: Card(
                                      elevation: 5.0,
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            child: Image.network(rentPropertyData2.toList()[index].pic ?? 'https://cdn.dribbble.com/users/3638706/screenshots/10188432/db2-01.jpg',height: h*0.35,fit: BoxFit.fill,),
                                            borderRadius: BorderRadius.circular(20.0)   ,),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(rentPropertyData2.toList()[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: h*0.016,color: Colors.black),),
                                                    SizedBox(height: h*0.01,),
                                                    Text('Rent: Rs.${rentPropertyData2.toList()[index].price} Crore',style: TextStyle(fontSize: h*0.016,color: Colors.black45),),
                                                    SizedBox(height: h*0.01,),
                                                    Text(rentPropertyData2.toList()[index].type,style: TextStyle(fontSize: h*0.016,color: Colors.black45),),
                                                    SizedBox(height: h*0.01,),
                                                    Text('Property ID: ${rentPropertyData2.toList()[index].id}',style: TextStyle(fontSize: h*0.016,color: Colors.indigo),),
                                                  ],
                                                ),
                                                RaisedButton(
                                                  color: Colors.orange,
                                                  child: Text('View Details',style: TextStyle(color: Colors.white),) ,
                                                  onPressed: () {
                                                    setState(() {
                                                      loader = true;
                                                    });
                                                    Navigator.of(context).push(AdminPanel1(rentPropertyData2.toList()[index]));
                                                    setState(() {
                                                      loader = false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else{
            return Container(
              height: h*0.5,
              width: w,
              child: Center(child: Text('Sorry!! No Listing Found.',style: TextStyle(color: Colors.red),)),
            ) ;
          }
        }else{
          return Container(
            height: h*0.5,
            width: w,
            child: Center(child: Text('Sorry!! No Listing Found.',style: TextStyle(color: Colors.red),)),
          ) ;
        }
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<PropertyData> property;

  CustomSearchDelegate({this.property});

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for the app bar
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }


  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListTile(
            onTap: (){

            },
            title: Text('Not Found'),
            //onTap: () => Navigator.of(context).push(_NewPage2(2)),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something

    var myList =  property.where((p) => p.title.toLowerCase().contains(query.toLowerCase())).toList();
    //final myList =  property.where((p) => p.price.contains(_amountfilter);


    return myList.isEmpty? Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text('Not found... '),
    ) : ListView.builder(
      itemCount:myList.length,
      itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(AdminPanel1(myList.toList()[index]));
            },
            leading: Icon(Icons.home),
            title: Text(myList[index].title,
            ),
          ),
        );
      },

    );
  }

}

class AdminPanel1 extends MaterialPageRoute<Null> {
  AdminPanel1(PropertyData property)
      : super(builder: (BuildContext context) {
    final user = Provider.of<User>(context);

    Future<void> _showlogoutDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('REMOVE PROPERTY'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to remove this property?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL', style: TextStyle(color: Colors.blue),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('DELETE', style: TextStyle(color: Colors.red),),
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  await DatabaseService().delRentPropertyDocument(property.id);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Details',),
        actions: [
          user == null ? Container() :
          user.email == 'gems.property1@gmail.com'
              ? FlatButton(
            onPressed: (){
              _showlogoutDialog();
            },
            child: Text('REMOVE'),
          ) : Container(),
        ],
      ),
      body: PropertyRentDetails(property: property,),
    );
  });
}
