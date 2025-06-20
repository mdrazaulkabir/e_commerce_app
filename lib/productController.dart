import 'dart:convert';

import 'package:e_commerce_app/productModel.dart';
import 'package:e_commerce_app/urls.dart';
import 'package:http/http.dart' as http;
class ProductController {

  List<Data> products=[];
  Future<void>fetchProduct()async{
    final response= await http.get(Uri.parse(Urls.readProduct));
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      productModel model=productModel.fromJson(data);
      products=model.data ?? [];
    }
  }

}