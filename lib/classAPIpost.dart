import 'dart:convert';

import 'package:http/http.dart' as http;
import 'global.dart' as global;
// ignore: camel_case_types
class dataAPIpost {
  // String title;
  // String thumb;
  // String key;
  // String times;
  // String portion;
  // String dificulty;

  int userid;
  int id;
  String title;
  String body;

  dataAPIpost({
    this.userid, this.id, this.title, this.body
    });

    static Future<List<dataAPIpost>> getData(int myid) async {
    String urlAPI = 'https://jsonplaceholder.typicode.com/posts?userId='+ myid.toString();
    var apiresult = await http.get(Uri.parse(urlAPI));

    var jsonobj = json.decode(apiresult.body);
    // print(jsonobj[1]['id']);
    global.listpost.clear();
    for(int i = 0; i < jsonobj.length; i++)
    {
      global.listpost.add(dataAPIpost(userid: jsonobj[i]['userId'], id: jsonobj[i]['id'], title: jsonobj[i]['title'], body: jsonobj[i]['body'])); 
    }
    return global.listpost;
  }
}
