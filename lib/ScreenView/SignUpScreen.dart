import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.black]
            )
          ),
        ),
        title: Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  label: Text("Email"),
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
              controller: password,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.height*0.06,
            child: CupertinoButton(
                color: Colors.blue,
                child: Text("Sign Up"), onPressed: ()async{
              try {
               await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
               // Get.Snackbar(messageText: Text(""));
               // Get.back();
                //Get.snackbar("Sign Up Success", "Register Success");
                Get.back();
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }
            }),
          ),
        ],
      ),
    );
  }
}
