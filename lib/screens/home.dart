import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:gemsproperty/adminData/bankFormData.dart';
import 'package:gemsproperty/adminData/buildingFormData.dart';
import 'package:gemsproperty/adminData/buyerForm%20Data.dart';
import 'package:gemsproperty/adminData/contactFormData.dart';
import 'package:gemsproperty/adminData/designFormData.dart';
import 'package:gemsproperty/adminData/rentalFormData.dart';
import 'package:gemsproperty/adminData/sellerFormData.dart';
import 'package:gemsproperty/database.dart';
import 'package:gemsproperty/screens/ContactUs.dart';
import 'package:gemsproperty/screens/about.dart';
import 'package:gemsproperty/screens/addProperty.dart';
import 'package:gemsproperty/screens/agentForm.dart';
import 'package:gemsproperty/screens/banking.dart';
import 'package:gemsproperty/screens/buyersForm.dart';
import 'package:gemsproperty/screens/construction.dart';
import 'package:gemsproperty/screens/propertyListBuy.dart';
import 'package:gemsproperty/screens/propertyListRent.dart';
import 'package:gemsproperty/screens/rentalForm.dart';
import 'package:gemsproperty/screens/sellerForm.dart';
import 'package:gemsproperty/screens/team.dart';
import 'package:gemsproperty/services/auth.dart';
import 'package:gemsproperty/services/loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:gemsproperty/adminData/agentRequestFormData.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final AuthService _auth = AuthService();
  bool loader = false;
  String gError = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String email = '';
  String password = '';


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

    final user = Provider.of<User>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final drawerHeader = UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.indigo
      ),
      accountName: user == null ? Text(''): Text(user.username),
      accountEmail: null,
      currentAccountPicture: CircleAvatar(
        radius: 40.0,
        backgroundImage: user == null ? NetworkImage('https://png.pngtree.com/png-vector/20190321/ourmid/pngtree-vector-users-icon-png-image_856952.jpg'): NetworkImage(user.photo ?? ''),
        backgroundColor: Colors.transparent,
      ),
    );

    Future<void> _showSubmitPropertyDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('SELLER FORM',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(SellerForm1());
                    },
                  ),
                  SizedBox(height: 10.0,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('RENTAL FORM',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(RentalForm1());
                    },
                  ),
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
          child: AddProperty(),
        );
      });
    }


    Future<void> _showAdminPanelDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('ADMIN PANEL',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('POST A NEW PROPERTY',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showAddCoursePanel();
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('SELLER FORM DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(SellerFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('RENTAL FORM DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(RentalFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('BANKING DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(BankFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('CONSTRUCTION DESIGN DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(DesignFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('CONSTRUCTION BUILDING DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(BuildingFormData1());
                    },
                  ),
//                  SizedBox(height: h*0.01,),
//                  RaisedButton(
//                    color: Colors.indigo[700],
//                    child: Text('INVESTMENT',style: TextStyle(color: Colors.white),),
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                      Navigator.of(context).push(RentalForm1());
//                    },
//                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('BUYERS FORM DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(BuyerFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('AGENT REQUEST DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(AgentRequestFormData1());
                    },
                  ),
                  SizedBox(height: h*0.01,),
                  RaisedButton(
                    color: Colors.indigo[700],
                    child: Text('CONTACTED US DATA',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(ContactFormData1());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
    Future<void> _showlogoutDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to logout?'),
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
                child: Text('LOGOUT', style: TextStyle(color: Colors.red),),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
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


    return StreamProvider<List<PropertyData>>.value(
      value: DatabaseService().buyPropertyData,
      child: loader ? Loader() :  Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: [
                    user == null ? FlatButton(
                      child: Row(
                        children: [
                          Icon(Icons.account_circle_sharp,color: Colors.white,),
                          SizedBox(width: 5.0,),
                          Text('Sign In',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      onPressed: (){
                        _showlogin();
                      },
                    ) : Container(),
                    user == null ? Container() :
                    user.email == 'gems.property1@gmail.com' ?
                    IconButton(icon: Icon(Icons.security,color: Colors.white,), onPressed: (){
                      _showAdminPanelDialog();
                    }
                    ,iconSize: h*0.03,) : Container(),
                    SizedBox(width: 10.0  ,)
                  ],
                  backgroundColor: Colors.indigo,
                  expandedHeight: h*0.3,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("HOME",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )),
                      background: Image.asset('assets/home.png',fit: BoxFit.fitHeight,)),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.indigo,
                      tabs: [
                        Tab( text: "BUY", icon: Icon(Icons.home),),
                        Tab( text: "SELL", icon: Icon(Icons.attach_money),),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                PropertyListBuy(),
                PropertyListRent(),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                drawerHeader,
                ListTile(
                  leading: Icon(Icons.add_circle_outline),
                  title: Text('SUBMIT YOUR PROPERTY'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      _showSubmitPropertyDialog();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('BANKING'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(Banking1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.build),
                  title: Text('CONSTRUCTION'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(Construction1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('INVESTMENT'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(Investment1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment),
                  title: Text('BUYERS FORM'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(BuyersForm1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment_ind),
                  title: Text('AGENT REQUEST FORM'),
                  onTap: () {
    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(AgentForm1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('TEAM'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(Team1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('CONTACT US'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(ContactUs1());
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.error),
                  title: Text('ABOUT'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.of(context).push(About1());
                    });
                  },
                ),
                user == null ? Container() : ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      _showlogoutDialog();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
//        floatingActionButton: FloatingActionButton(
//          mini: false,
//          autofocus: true,
//          backgroundColor: Colors.indigo,
//          onPressed: (){
//          },
//          child: Icon(Icons.search,color: Colors.white,),
//        ),
      ),
    );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
class SellerForm1 extends MaterialPageRoute<Null> {
  SellerForm1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELLER FORM'),
      ),
        body: SellerForm(),
    );
  });
}
class SellerFormData1 extends MaterialPageRoute<Null> {
  SellerFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<SellerFormData>>.value(
      value: DatabaseService().sellerFormData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SELLER FORM DATA'),
        ),
       body: SellerFormData2(),
      ),
    );
  });
}
class RentalForm1 extends MaterialPageRoute<Null> {
  RentalForm1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RENTAL FORM'),
      ),
      body: RentalForm(),
    );
  });
}
class RentalFormData1 extends MaterialPageRoute<Null> {
  RentalFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<SellerFormData>>.value(
      value: DatabaseService().rentalFormData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('RENTAL FORM DATA'),
        ),
        body: RentalFormData2(),
      ),
    );
  });
}
class Banking1 extends MaterialPageRoute<Null> {
  Banking1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BANKING'),
      ),
      body: Banking(),
    );
  });
}
class BankFormData1 extends MaterialPageRoute<Null> {
  BankFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<BankData>>.value(
      value: DatabaseService().bankData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BANKING FORM DATA'),
        ),
        body: BankFormData2(),
      ),
    );
  });
}
class Construction1 extends MaterialPageRoute<Null> {
  Construction1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONSTRUCTION'),
      ),
      body: Construction(),
    );
  });
}
class DesignFormData1 extends MaterialPageRoute<Null> {
  DesignFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<ConstructionData>>.value(
      value: DatabaseService().designData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CONSTRUCTION DESIGN FORM DATA'),
        ),
        body: DesignFormData2(),
      ),
    );
  });
}
class BuildingFormData1 extends MaterialPageRoute<Null> {
  BuildingFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<ConstructionData>>.value(
      value: DatabaseService().buildingData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CONSTRUCTION BUILDING FORM DATA'),
        ),
        body: BuildingFormData2(),
      ),
    );
  });
}
class Investment1 extends MaterialPageRoute<Null> {
  Investment1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GEMS INVESTMENT'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.blue[300],
            Colors.white,
          ])
    ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('We believe in the power of entrepreneurial thinking, therefore we have establish our GEMS Investment service to serve our clients across the country for investment focusing only Real estate . '
    'Not only we assist our clients sell or buy properties we provide capital for or genuine clients. Additionally we are ready to invest in large ventures whether it be housing or plotting.By combining the solutions-driven '
    'mindset of a startup and the sophistication of a luxury brand, we’re building the first professional company to bring together different individuals ready and interested to invest in real estate.'
    'GEMS Investment company is happy to invest in good properties or simply buy  from our generous clients. We are ready to plough money in housing construction and Plotting. We do invest in building dream home for our costumers.',style: TextStyle(fontSize: 20.0,),textAlign: TextAlign.justify,),
        ),
      ),
    );
  });
}
class BuyersForm1 extends MaterialPageRoute<Null> {
  BuyersForm1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUY A PROPERTY?'),
      ),
      body: BuyersForm(),
    );
  });
}
class BuyerFormData1 extends MaterialPageRoute<Null> {
  BuyerFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<BuyerFormData>>.value(
      value: DatabaseService().buyerData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BUYER FORM DATA'),
        ),
        body: BuiyerFormData2(),
      ),
    );
  });
}
class AgentRequestFormData1 extends MaterialPageRoute<Null> {
  AgentRequestFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<AgentRequestData>>.value(
      value: DatabaseService().agentRequestData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AGENT REQUEST DATA'),
        ),
        body: AgentRequestFormData2(),
      ),
    );
  });
}
class AgentForm1 extends MaterialPageRoute<Null> {
  AgentForm1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGENT APPLICATION'),
      ),
      body: AgentForm(),
    );
  });
}
class Team1 extends MaterialPageRoute<Null> {
  Team1()
      : super(builder: (BuildContext context) {

    return StreamProvider<List<AgentData>>.value(
      value: DatabaseService().agentData,
      child: Scaffold(
        body: Team(),
      ),
    );
  });
}
class About1 extends MaterialPageRoute<Null> {
  About1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT'),
      ),
      body: About(),
    );
  });
}
class ContactUs1 extends MaterialPageRoute<Null> {
  ContactUs1()
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTACT US'),
      ),
      body: ContactUs(),
    );
  });
}
class ContactFormData1 extends MaterialPageRoute<Null> {
  ContactFormData1()
      : super(builder: (BuildContext context) {
    return StreamProvider<List<ContactUserFormData>>.value(
      value: DatabaseService().contactUserData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CONTACT / ENQUIRY FORM DATA'),
        ),
        body: ContactFormData2(),
      ),
    );
  });
}