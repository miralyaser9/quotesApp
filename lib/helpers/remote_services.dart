import 'dart:convert';

import 'package:qotesapp/models/quote_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices{
  Future<QuoteModel> getQuote()async{
    var response= await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes?category=happiness&X-Api-Key=6W7QkGyAeMeXFBJfAMefSA==XrCF8mA2DrHjAFzt'));
    if(response.statusCode==200){

      List<dynamic> data=jsonDecode(response.body);
      return QuoteModel.fromJson(data[0]);
    }
    else{
      throw Exception("the status code is ${response.statusCode}");
    }
  }
}