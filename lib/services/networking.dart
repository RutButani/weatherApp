import 'dart:convert';
import 'package:http/http.dart' as http;//to show get is come from http

class NetworkHelper
{
  NetworkHelper(this.url);
  final String url;

  Future getData() async
  {
    http.Response responce=await http.get(url);
    print(responce.body);

    if(responce.statusCode==200)
    {
      String data= responce.body;



      return jsonDecode(data);

    }
    else
    {
      print(responce.statusCode);
    }

  }
}