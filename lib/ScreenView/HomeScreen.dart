import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etectfirebase1/ScreenView/DetailScreen.dart';
import 'package:etectfirebase1/ScreenView/InsertScreen.dart';
import 'package:etectfirebase1/ScreenView/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   FirebaseAuth auth = FirebaseAuth.instance;
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
        title: Text("Menu"),
        actions: [
          IconButton(onPressed: (){
            Get.to(InsertScreen());
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: ()async{
           try{
            await auth.signOut();
            Get.offAll(LoginScreen());
           }catch(e){
             Get.snackbar("SignOut Fail", "Please Try Again");
           }
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("tbProduct").snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
              crossAxisSpacing: 50,
              children: snapshot.data!.docs.map((snap) {
                return GestureDetector(
                  onTap: (){
                    Get.to(DetailScreen(
                      documentSnapshot: snap,
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${snap["Image"]}")
                          )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${snap["Product"]}"),
                          Text("\$${snap["Price"]}")
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
              ),
            );
          }),
    );
  }
}
