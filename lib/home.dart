import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    void productDialog(){
      showDialog(context: context, builder: (context){
        TextEditingController productNameController=TextEditingController();
        TextEditingController productImageController=TextEditingController();
        TextEditingController productQTYCotroller=TextEditingController();
        TextEditingController productUnitPriceController=TextEditingController();
        TextEditingController productTotalPriceControlller=TextEditingController();
        return AlertDialog(
          title: Text("Add production"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Product Name"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Product Image link"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Product Quantity"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Product Price"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Product Total price"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Product Name"),
              ),

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
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          productDialog();
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
