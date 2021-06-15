import 'dart:convert';

import 'package:http/http.dart' as http;
import 'global.dart' as global;
// ignore: camel_case_types
class dataAPI {
  // String title;
  // String thumb;
  // String key;
  // String times;
  // String portion;
  // String dificulty;

  int id;
  String name;
  String email;
  String jalan;
  String suite;
  String kota;
  String zipcode;
  String phone;
  String website;
  String namecompany;
  String catchcompany;
  String bscompany;

  dataAPI({
    this.id, this.name,this.email, this.jalan, this.suite, this.kota, this.zipcode, this.phone, this.website, this.namecompany, this.catchcompany, this.bscompany
    });
  
  // contructor tpi return sesuatu
  // factory dataAPI.createData(Map<String, dynamic> object){
  //   return dataAPI(title: object['title'], thumb: object['thumb'], key: object['key'], times: object['times'], portion: object['portion'], dificulty: object['dificulty']);
  //   // return dataAPI(title: object['title'], thumb: object['thumb'], key: object['key'], times: object['times'], portion: object['portion'], dificulty: object['dificulty']);
  // }

  // static Future<List<dataAPI>> getData() async {
  //   String urlAPI = 'https://masak-apa-tomorisakura.vercel.app/api/recipes';
  //   var apiresult = await http.get(Uri.parse(urlAPI));

  //   var jsonobj = json.decode(apiresult.body);
  //   List<dynamic> data = (jsonobj as Map<String, dynamic>)['results'];
  //   List<dataAPI> listdata = [];
  //   for(int i = 0; i < data.length; i++)
  //   {
  //     listdata.add(dataAPI.createData(data[i]));
  //   }
  //   return listdata;
  // }

    static Future<List<dataAPI>> getData() async {
    String urlAPI = 'https://jsonplaceholder.typicode.com/users';
    var apiresult = await http.get(Uri.parse(urlAPI));

    var jsonobj = json.decode(apiresult.body);
    // print(jsonobj[1]['id']);
    global.listuser.clear();
    for(int i = 0; i < jsonobj.length; i++)
    {
      global.listuser.add(dataAPI(id: jsonobj[i]['id'], name: jsonobj[i]['name'], email: jsonobj[i]['email'], jalan: jsonobj[i]['address']['street'], suite: jsonobj[i]['address']['suite'], kota: jsonobj[i]['address']['city'], zipcode: jsonobj[i]['address']['zipcode'], phone: jsonobj[i]['phone'], website: jsonobj[i]['website'], namecompany: jsonobj[i]['company']['name'], catchcompany: jsonobj[i]['company']['catchPhrase'], bscompany: jsonobj[i]['company']['bs'])); 
    }
    return global.listuser;
  }
}
