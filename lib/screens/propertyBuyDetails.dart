import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemsproperty/screens/enquiry.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gemsproperty/database.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class PropertyRentDetails extends StatefulWidget {
  final PropertyData property;

  const PropertyRentDetails({Key key, this.property}) : super(key: key);

  @override
  _PropertyRentDetailsState createState() => _PropertyRentDetailsState();
}

class _PropertyRentDetailsState extends State<PropertyRentDetails> {
  final AuthService _auth = AuthService();
  String gError = '';
  String error = '';
  bool loader = false;

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

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);

    Future<void> _showlogin() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Sign In')),
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


    void _showAddCoursePanel(){
      showDialog(context: context, builder: (BuildContext context) {
        return Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
          child: Enquiry(),
        );
      });
    }



    return Container(
      height: h,
      width: w,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Image.network(widget.property.pic ?? 'https://cdn.dribbble.com/users/3638706/screenshots/10188432/db2-01.jpg',height: h*0.389,fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 5.0, 5.0),
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 0.5,),
                      SizedBox(height: h*0.04,),
                      Text(widget.property.title.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: h*0.04),),
                      SizedBox(height: h*0.010,),
                      Text('TYPE:    ${widget.property.type.toUpperCase()}',style: TextStyle(color: Colors.indigo,fontSize: h*0.02),),
                      SizedBox(height: h*0.015,),
                      Text('RENT:   Rs.${widget.property.price} Crore',style: TextStyle(color: Colors.indigo,fontSize: h*0.02),),
                      SizedBox(height: h*0.02,),
                      Text('BEDROOMS: ${widget.property.bedrooms}',style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                      SizedBox(height: h*0.02,),
                      Text(widget.property.description,style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                      SizedBox(height: h*0.02,),
                      Divider(height: 0.5,),
                      SizedBox(height: h*0.02,),
                      Text('Additional Information',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: h*0.02),),
                      SizedBox(height: h*0.010,),
                      Text('Area: ${widget.property.area}',style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                      SizedBox(height: h*0.010,),
                      Text('House Facing: ${widget.property.face}',style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                      widget.property.agentName != null ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: h*0.02,),
                            Text('Additional Information',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: h*0.02),),
                            SizedBox(height: h*0.010,),
                            Text('Agent Name: ${widget.property.agentName}',style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                            SizedBox(height: h*0.010,),
                            Text('Agent No.: ${widget.property.agentNo}',style: TextStyle(color: Colors.black,fontSize: h*0.018),),
                          ],
                        ),
                      ) : Container(),
                    ],
                  )
              ),
            ),
            SizedBox(height: h*0.020,),
            ButtonTheme(
              minWidth: w*0.9,
              child: RaisedButton(
                color: Colors.orange,
                child: Text('ENQUIRY ABOUT PROPERTY',style: TextStyle(color: Colors.white),),
                onPressed: (){
                  if(user == null){
                    _showlogin();
                  }else{
                    _showAddCoursePanel();
                  }
                },
              ),
            ),
            SizedBox(height: h*0.010,),
          ],
        ),
      ),

    );
  }
}
