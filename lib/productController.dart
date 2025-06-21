import 'dart:convert';
import 'package:e_commerce_app/productModel.dart';
import 'package:e_commerce_app/urls.dart';
import 'package:http/http.dart' as http;
class ProductController {

  List<Data> products=[];
  Future<void>fetchProduct()async{
    final response= await http.get(Uri.parse(Urls.readProduct));
    print(response.statusCode);
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      productModel model=productModel.fromJson(data);
      products=model.data ?? [];
    }
  }

  Future<void>CreateProduct(String productName,String img, int qty,int unitPrice,int totalPrice,String? productId,bool isUpdate)async{
    final response=await http.post(isUpdate? Uri.parse(Urls.updateProduct(productId!)):Uri.parse(Urls.createProduct),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode({
        "ProductName": productName,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice
      })
    );
    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if(response.statusCode==201){
     await fetchProduct();
    }
  }


  Future<bool>deleteProduct(String idProduct)async{
    final response=await http.get(Uri.parse(Urls.deleteProduct(idProduct)));
    if(response.statusCode==200){
      fetchProduct();
      return true;
    }
    else{
      return false;
    }
  }

}