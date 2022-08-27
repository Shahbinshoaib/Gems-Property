import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemsproperty/screens/addAgent.dart';
import 'package:gemsproperty/screens/propertyBuyDetails.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';


class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {


  bool loader = false;
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);


    void _showAddCoursePanel(){
      showDialog(context: context, builder: (BuildContext context) {
        return Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
          child: AddAgent(),
        );
      });
    }

    final agentData = Provider.of<List<AgentData>>(context) ?? [];


    return Scaffold(
      appBar: AppBar(
        title: Text('TEAM'),
        actions: [
          user == null ? Container() :
          user.email == 'gems.property1@gmail.com' ?
          IconButton(icon: Icon(Icons.add_to_queue,color: Colors.white,), onPressed: (){
            _showAddCoursePanel();
          }
            ,iconSize: h*0.03,) : Container(),
        ],
      ),
      body:  agentData.length != 0 ? SingleChildScrollView(
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
          height: h*0.915,
          width: w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: agentData.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: h*0.04),
                  child: Column(
                    children: [
                      Container(
                        height: h*0.8,
                        width: w*0.92,
                        child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: h*0.15,
                                  width: h*0.92,
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(agentData[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: h*0.035),),
                                      Text(agentData[index].designation,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: h*0.023),),
                                      Text(agentData[index].area,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: h*0.022),),

                                    ],
                                  ),
                                ),
                                Image.network(agentData[index].pic ?? 'https://cdn2.iconfinder.com/data/icons/user-23/512/User_Yuppie_1.png',height: h*0.5415,fit: BoxFit.fitHeight,),
                                Container(
                                  height: h*0.1,
                                  width: w*0.92,
                                  color: Colors.indigo,
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(agentData[index].email,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: h*0.023),),
                                      Text(agentData[index].phone,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: h*0.022),),

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
              },
            ),
          ),
        ),
      ) : Loader(),
    ) ;
  }
}

