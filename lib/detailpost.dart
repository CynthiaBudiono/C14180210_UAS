import 'package:flutter/material.dart';
import 'global.dart' as global;
import 'package:google_fonts/google_fonts.dart';
// import 'classAPIpost.dart';

class DetailPost extends StatefulWidget {
  // const DetailPost({ Key? key }) : super(key: key);

  @override
  _DetailPostState createState() => _DetailPostState();

  final int data;
  const DetailPost(this.data);
}

class _DetailPostState extends State<DetailPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(global.listpost[widget.data].title, style: GoogleFonts.frederickaTheGreat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 20),)),
        body: Container(
          margin: const EdgeInsets.all(40.0),
            child: Center(
              
                child: Column(
          children: <Widget>[
            // Text(global.listuser[widget.data].id.toString()),
            SizedBox(
              height: 20,
            ),
             Text(
              global.listpost[widget.data].title,
              style: GoogleFonts.cormorantGaramond(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 30),
            ),
            SizedBox(height: 30,),
            Icon(Icons.voicemail_sharp, color: Colors.green, size: 30,),
            SizedBox(
              height: 40,
            ),
            Text(
              global.listpost[widget.data].body,
              style: GoogleFonts.cormorantGaramond(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 25),
            ),
          ],
        ))));
  }
}
