import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:provider/provider.dart';

class DesignFormData2 extends StatefulWidget {
  @override
  _DesignFormData2State createState() => _DesignFormData2State();
}

class _DesignFormData2State extends State<DesignFormData2> {
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
                                      Text(formData2.toList()[index].name,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].address,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Mobile: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].mobile,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Landline: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].landline,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Email: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].email, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Land Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].landAddress,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Land Area: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].landArea,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Type of project: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].type,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Square footage Maximum: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].sfMax,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Square footage Minimum: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].sfMin,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Storey: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].storey, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Rooms Needed: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].room, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Bathrooms Needed: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].bathroom,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Parking: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].parking,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Stair: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].stairs,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Roof Type: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].roof,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Pooja Room: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].pooja ,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Store Room: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].store , style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Underground Rank: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].underground,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Extra features: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].extra,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Additional Notes: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].additional,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
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
