import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'classAPI.dart';
import 'detailpost.dart';
import 'detailusers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHome(),
        '/DetailUsers': (context) =>
            DetailUsers(ModalRoute.of(context).settings.arguments as int),
        '/DetailPost': (context) =>
            DetailPost(ModalRoute.of(context).settings.arguments as int),
      },
      title: "USER",
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}

class MyHome extends StatefulWidget {
  // const MyHome({ Key? key }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void initState() {
    super.initState();
    getlistapi();
    // userAPI.connectToAPI().then((hasil) {
    //   this.setState(() {});
    // });
  }

  List<dataAPI> list = [];
  void getlistapi() {
    dataAPI.getData().then((hasil) {
      list = hasil;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List USER", style: GoogleFonts.frederickaTheGreat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 20),),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:10),
              Text("All User", style: GoogleFonts.cormorantGaramond(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 30),),
                  SizedBox(height: 10,),
              Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(list[index].id.toString()),
                            subtitle: Text(list[index].name),
                            onTap: () {
                              Navigator.pushNamed(context, '/DetailUsers',
                                  arguments: index);
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(list[index].myemail)));
                            });
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
