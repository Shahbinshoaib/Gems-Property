import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return SingleChildScrollView(
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
        child:  Padding(
            padding: EdgeInsets.fromLTRB(h*0.015, h*0.015, h*0.015, h*0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.02,),
                Center(child: Text('The real estate industry is a \$217 trillion-plus global asset class, yet it has been largely untouched by technology.'
      ' Buying and selling decisions are among the most important a person can make in life, but today, the majority of those decisions are based on gut '
      'instincts or outdated information. At Gems, we believe that agents—and their clients—deserve better.\n\nBy combining the solutions-driven mindset of a'
      ' startup and the sophistication of a luxury brand, we’re building the operating system for real estate. We empower agents from start to finish by'
      ' developing innovative digital tools and customized marketing strategies. Why? Because we know that when agents can spend more time building relationships'
      ' with clients, everyone wins. \n\nThe team at Gems Property services are more than real estate agents looking for real estate listings. We are a dedicated'
                    'team of truly passionate, property professionals who understand our clients’ needs and wants. When making property decisions that impact'
                    ' your family now and, in the future, you need a Premium property partner. We understand that your home is an important part of your life,'
                    ' it houses your family, it’s where memories are made and it provides for your future.',
                  style: TextStyle(fontSize: 19.0,),textAlign: TextAlign.justify,)),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Company Overview',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                Center(child: Text('Gems Property Services is the first modern real estate platform in Nepal, pairing the industry’s top talent with technology '
                    'to make the search and sell experience, intelligent and seamless. As an innovative residential real estate firm, we empower our agents so they '
                    'have more time for advising their clients and with the solutions-driven mindset we provide our clients simplified real – Real Estate service.'
                    '\n\nGems Property service has been built upon a foundation of high ethics and a solid structure of customer focus driven to proactively solve the '
                    'evolving need and wants of our owner’s & Vendors. Our management prides itself on providing outstanding customer service delivered by a highly '
                    'qualified team of Property Managers and Supportive Administration Team. We believe that our appointment ensures a high standard of professional'
                    ' advice, administration and integrity that benefits all proprietors as it provides a necessary form of protection for your assets.',
                  style: TextStyle(fontSize: 19.0,),textAlign: TextAlign.justify,)),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Premium Values',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                Center(child: Text('Integrity — Our agents will always provide you with honest, carefully considered advice. We will ensure you are in the best possible'
                    ' position to make clear decisions. Your success is our principal driver. \n\nProfessionalism — Luxury real estate is our passion and it demands our focus.'
                    ' We strive to provide a high level of personalized service, whether you are a vendor or a potential purchaser. \n\nExpertise — Service and integrity '
                    'supported by commercial expertise is where Gems stands apart. A depth of local knowledge and eye for opportunities, we are your property partner.',
                  style: TextStyle(fontSize: 19.0,),textAlign: TextAlign.justify,)),
                SizedBox(height: h*0.02,),
                SizedBox(height: h*0.02,),
                Center(child: Text('Our Principles',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: h*0.02,),
                Center(child: Text('The Compass entrepreneurial principles embody our values and define our culture.'
                  '\n\n1.Dream big.'
                  '\n2.Move fast.'
                  '\n3.Learn from reality.'
                  '\n4.Be solutions-driven.'
                  '\n5.Obsess about opportunities.'
                  '\n6.Collaborate without ego.'
                  '\n7.Maximize your strength.'
                  '\n8.Bounce back with passion.',
                  style: TextStyle(fontSize: 19.0,),textAlign: TextAlign.justify,)),
                SizedBox(height: h*0.02,),

              ],
            )
        ),
      ),
    );
  }
}
