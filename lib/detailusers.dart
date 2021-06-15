import 'package:flutter/material.dart';
import 'global.dart' as global;
import 'classAPIpost.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailUsers extends StatefulWidget {
  // const DetailUsers({ Key? key }) : super(key: key);

  @override
  _DetailUsersState createState() => _DetailUsersState();

  final int data;
  const DetailUsers(this.data);
}

class _DetailUsersState extends State<DetailUsers> {
  double iconSize = 10;
  void initState() {
    super.initState();
    getlistapipost();
  }

  List<dataAPIpost> list = [];
  void getlistapipost() {
    dataAPIpost.getData(global.listuser[widget.data].id).then((hasil) {
      list = hasil;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: widget.data == null
                ? Text("Please back homepage")
                : Text(
                    global.listuser[widget.data].name,
                    style: GoogleFonts.frederickaTheGreat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 20),
                  )),
        body: Container(
            child: Center(
                child: Column(
          children: <Widget>[
            // Text(global.listuser[widget.data].id.toString()),
            widget.data == null
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back Home"))
                : Text(
                    "Nama : " + global.listuser[widget.data].name,
                    style: GoogleFonts.kreon(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 18),
                  ),
            Text(
              "Address : " +
                  global.listuser[widget.data].jalan +
                  " " +
                  global.listuser[widget.data].suite +
                  ", " +
                  global.listuser[widget.data].kota,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            Text(
              "ZipCode : " + global.listuser[widget.data].zipcode,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            Text(
              "Phone : " + global.listuser[widget.data].phone,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            Text(
              "Website : " + global.listuser[widget.data].website,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            Text(
              "Company : " + global.listuser[widget.data].namecompany,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            Text(
              "Motto : " + global.listuser[widget.data].catchcompany,
              style: GoogleFonts.kreon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 18),
            ),
            SizedBox(height: 20,),
            Text(
              "My Posts",
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    children: List.generate(list.length, (index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            print(index);
                            Navigator.pushNamed(context, '/DetailPost',
                                arguments: index);
                          },
                          child: Card(
                            color: Colors.orange,
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.voicemail_sharp,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        list[index].title,
                                        style: GoogleFonts.indieFlower(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: .5,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    }))),
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: list.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //               title: Text(list[index].title),
            //               subtitle: Text(list[index].body),
            //               onTap: () {
            //                 // Navigator.pushNamed(context, '/DetailUsers',
            //                 //     arguments: index);
            //                 // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(list[index].myemail)));
            //               });
            //         })),
          ],
        ))));
  }
}
