import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:provider/provider.dart';

class BankFormData2 extends StatefulWidget {
  @override
  _BankFormData2State createState() => _BankFormData2State();
}

class _BankFormData2State extends State<BankFormData2> {
  @override
  Widget build(BuildContext context) {

    final formData = Provider.of<List<BankData>>(context) ?? [];
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
                                      Text('Date of Birth: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].dob,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Place of Birth: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].pob,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Martial Status: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].status,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('No. of Dependents: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].dependents, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('No. of Children: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].children,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Nationality: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].nationality,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Father\'s Name: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].father,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Mother\'s Maidan Name: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].mother,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Permanent Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].address,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Street Name: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].sName, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('City: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].city, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('District: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].district,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('State: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].state,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Nature of Occupation: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].occu,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Cost of Property: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].cost,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Down payment: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].down,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Down payment %: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].down2, style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),
                                  SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Loan Amount: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].loan,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Repayment: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].repayment,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Loan for: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].loanFor,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Row(
                                    children: [
                                      Text('Balance Transfer from another bank: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                      Text(formData2.toList()[index].balance,style: TextStyle(fontSize: h*0.018),),
                                    ],
                                  ),SizedBox(height: h*0.01,),
                                  Text('Reimbursement of expenditure incurred in past 12 months: ',style: TextStyle(color: Colors.black,fontSize: h*0.016,fontWeight: FontWeight.bold),),
                                  Text(formData2.toList()[index].exp, style: TextStyle(fontSize: h*0.018),),
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
          child: Center(child: Text('Sorry!! No Listing Found.',style: TextStyle(color: Colors.red),)),
        )
    );
  }
}
