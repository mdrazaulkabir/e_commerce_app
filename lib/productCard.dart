import 'package:e_commerce_app/productModel.dart';
import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Data product;
  const productCard({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              //width: 100,
              child: Image.network(
                  fit: BoxFit.cover,
                  "${product.img}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text("Product Name:${product.productName.toString()}",textAlign: TextAlign.justify,)),
                  Text("Price: ${product.unitPrice}  |  QTY: ${product.qty}")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        onEdit(); //here we create only onEdit so here,need to actually call the function using parentheses: onEdit()
                      },

                      //another way
                      //onPressed:onEdit,

                      icon: Icon(Icons.edit, color: Colors.blue,)),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        onDelete();
                      },
                      icon: Icon(Icons.delete, color: Colors.blue,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
