import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

getProduct() async{
  var url = Uri.parse('https://dummyjson.com/products');
  var response = await http.get(url);
  return (jsonDecode(response.body)['products']);
}