import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class InsertScreen extends StatelessWidget {
   InsertScreen({super.key});
   TextEditingController product = TextEditingController();
   TextEditingController price = TextEditingController();
   TextEditingController quantity = TextEditingController();
   TextEditingController image = TextEditingController();
   TextEditingController description = TextEditingController();
   CollectionReference tbProduct = FirebaseFirestore.instance.collection('tbProduct');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black,Colors.blue]
              )
          ),
        ),
        title: Text("Insert Screen"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: product,
              decoration: InputDecoration(
                  label: Text("Product"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: price,
              decoration: InputDecoration(
                  label: Text("Price"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: quantity,
              decoration: InputDecoration(
                  label: Text("Quantity"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: image,
              decoration: InputDecoration(
                  label: Text("Image"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: description,
              decoration: InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          CupertinoButton(child: Text("Insert"), onPressed: ()async{
            try{
              tbProduct.add({
                'Product':product.text,"Price":price.text,
                "Quantity":quantity.text,"Image":image.text,
                "Description":description.text
              });
              product.text="";
              price.text="";
              quantity.text="";
              image.text="";
              description.text="";
              Get.back();
            }catch(e){}
          }),
        ],
      ),
    );
  }
}
