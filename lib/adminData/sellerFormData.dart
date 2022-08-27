import 'package:flutter/material.dart';
import 'package:gemsproperty/database.dart';
import 'package:provider/provider.dart';

class SellerFormData2 extends StatefulWidget {
  @override
  _SellerFormData2State createState() => _SellerFormData2State();
}

class _SellerFormData2State extends State<SellerFormData2> {
  @override
  Widget build(BuildContext context) {

    final sellerFormData = Provider.of<List<SellerFormData>>(context) ?? [];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final sellerFormData2 = sellerFormData.reversed;

    print(sellerFormData);


    return Scaffold(
      backgroundColor: Colors.grey,
      body: sellerFormData2.length != 0 ? ListView.builder(
        itemCount: sellerFormData2.length,
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
                                    Text(sellerFormData2.toList()[index].date,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),SizedBox(height: h*0.01,),
                                Row(
                                  children: [
                                    Text('Full Name: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                    Text(sellerFormData2.toList()[index].name,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),SizedBox(height: h*0.01,),
                                Row(
                                  children: [
                                    Text('Address: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                    Text(sellerFormData2.toList()[index].address,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),SizedBox(height: h*0.01,),
                                Row(
                                  children: [
                                    Text('Mobile: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                    Text(sellerFormData2.toList()[index].mobile,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),SizedBox(height: h*0.01,),
                                Row(
                                  children: [
                                    Text('Landline: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                    Text(sellerFormData2.toList()[index].landline,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),SizedBox(height: h*0.01,),
                                Row(
                                  children: [
                                    Text('Email: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                    Text(sellerFormData2.toList()[index].email,style: TextStyle(fontSize: h*0.018),),
                                  ],
                                ),
                                SizedBox(height: h*0.01,),
                                Text('How soon do you need to sell the property?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].howSoon,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Do you currently live in the property?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].liveIn,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Type of property you are selling?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].type,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Type of Construction: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].constructionType,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('What kind of property are you selling?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].type2,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Do you have Nirman Sampanna Certificate?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].certificate,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Location: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].location,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Land Area: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].area,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Built Storey: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].storey,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Other: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].other,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Built up Area: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].area2,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('No of rooms in each floor excluding bathroom',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].room,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('No of bathrooms in each floor',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].bathroom,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Road Size: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].roadSize,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Road Type: ',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].roadType,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('How many car parking space do you have?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].parking,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Price of land per aana/dhur/kattha',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].price,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Total price in NPR (in lakhs)',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].totalPrice,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Reason for Selling?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].reason,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
                                SizedBox(height: h*0.01,),
                                Text('Any additional features of the property?',style: TextStyle(color: Colors.black,fontSize: h*0.018,fontWeight: FontWeight.bold),),
                                Text(sellerFormData2.toList()[index].feature,style: TextStyle(fontSize: h*0.018),),SizedBox(height: h*0.01,),
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
