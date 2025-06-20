import 'package:e_commerce_app/productCard.dart';
import 'package:e_commerce_app/productController.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductController productController=ProductController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  void fetchData()async{
    await productController.fetchProduct();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    void productDialog() {
      showDialog(
          context: context,
          builder: (context) {
            TextEditingController productNameController = TextEditingController();
            TextEditingController productImageController = TextEditingController();
            TextEditingController productQTYCotroller = TextEditingController();
            TextEditingController productUnitPriceController = TextEditingController();
            TextEditingController productTotalPriceControlller = TextEditingController();
            return AlertDialog(
              title: Text("Add production"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: productNameController,
                    decoration: InputDecoration(labelText: "Product Name"),
                  ),
                  TextField(
                    controller: productImageController,
                    decoration:
                        InputDecoration(labelText: "Product Image link"),
                  ),
                  TextField(
                    controller: productQTYCotroller,
                    decoration: InputDecoration(labelText: "Product Quantity"),
                  ),
                  TextField(
                    controller: productUnitPriceController,
                    decoration: InputDecoration(labelText: "Product Price"),
                  ),
                  TextField(
                    controller: productTotalPriceControlller,
                    decoration:
                        InputDecoration(labelText: "Product Total price"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close")),
                      ElevatedButton(
                          onPressed: () {
                            productController.CreateProduct(productNameController.text, productImageController.text, int.parse(productQTYCotroller.text.trim()), int.parse(productUnitPriceController.text.trim()), int.parse(productTotalPriceControlller.text.trim()));
                            Navigator.pop(context);
                            setState(() {

                            });
                          }, child: Text("Add product"))
                    ],
                  )
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          'E-Commerce App',
          style: TextStyle(
              shadows: [BoxShadow(offset: Offset(3, 3))],
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.lightGreenAccent),
        ),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side:BorderSide(color: Colors.greenAccent,width: 10) ),
      ),



      body: productController.products.isEmpty?
      Center(child: CircularProgressIndicator()):
      GridView.builder(
        itemCount: productController.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //  crossAxisSpacing: 1,
          // mainAxisSpacing: 35,
            crossAxisCount: 2, childAspectRatio: 1),
        itemBuilder: (context, index) {
          var product=productController.products[index];

          return productCard(

              onEdit:(){
              // print(productController.products.length);
              productDialog();
            },


              onDelete: (){
            productController.deleteProduct(product.sId.toString()).then((value)async{
              if(value){
                await productController.fetchProduct();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Successfully Deleted"),
                    duration: Duration(seconds: 3),),
                );
                setState(() {  });
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Something wrong...!"),
                    duration: Duration(seconds: 3),),
                );
              }
            });
          },
              product: product);
        },
      ),



      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          productDialog();
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}


