import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:provider/provider.dart';

class BuildingFormData2 extends StatefulWidget {
  @override
  _BuildingFormData2State createState() => _BuildingFormData2State();
}

class _BuildingFormData2State extends State<BuildingFormData2> {
  @override
  Widget build(BuildContext context) {

    final formData = Provider.of<List<ConstructionData>>(context) ?? [];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final formData2 = formData.reversed;

    return Scaffold(
        backgroundColor: Colors.grey,
        body: formData2.length != 0 ? ListView.builder(
          itemCount: formData2.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: w,
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Date: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].date,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Full Name: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].name2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].address2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Mobile: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].mobile2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Landline: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].landline2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Email: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].email2, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('New Build: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].newBuild,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Extension: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].extension,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Renovation: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].renovation,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Location of Proposed development: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].location2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Land Area: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].area2,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Storey: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].storey2, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Estimated budget: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].budget, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Text('Description of Work: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                  Text(formData2.toList()[index].description,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
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
        ) : Container(
          height: h*0.5,
          width: w,
          child: Center(child: Text('Sorry!! No Listing Found.',style: TextStyle(color: Colors.white),)),
        )
    );
  }
}
