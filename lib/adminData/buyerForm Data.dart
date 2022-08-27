import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:provider/provider.dart';

class BuiyerFormData2 extends StatefulWidget {
  @override
  _BuiyerFormData2State createState() => _BuiyerFormData2State();
}

class _BuiyerFormData2State extends State<BuiyerFormData2> {
  @override
  Widget build(BuildContext context) {

    final formData = Provider.of<List<BuyerFormData>>(context) ?? [];
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
                                      Text('Email: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].email, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Phone: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].mobile, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Property Type: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].type, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Preferred Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].address,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Preferred Budget: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].budget,style: TextStyle(fontSize: h*0.018),),
                                    ],
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
          },
        ) : Container(
          height: h*0.5,
          width: w,
          child: Center(child: Text('Sorry!! No Listing Found.',style: TextStyle(color: Colors.white),)),
        )
    );
  }
}
