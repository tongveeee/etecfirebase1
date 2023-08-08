import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
   DetailScreen({super.key,required this.documentSnapshot});
   QueryDocumentSnapshot documentSnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.blue]
            )
          ),
        ),
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.3,
             decoration: BoxDecoration(
                 color: Colors.blue,
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image: NetworkImage("${documentSnapshot['Image']}")
               )
             ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${documentSnapshot['Product']}",style: TextStyle(fontSize: 20),),
                Text("\$${documentSnapshot['Price']}",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("Description"),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("${documentSnapshot['Description']}",style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.bold
              ),)),
            ),
          ],
        ),
      ),
    );
  }
}
