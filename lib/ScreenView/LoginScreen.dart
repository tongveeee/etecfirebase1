import 'package:etectfirebase1/ScreenView/HomeScreen.dart';
import 'package:etectfirebase1/ScreenView/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   TextEditingController email= TextEditingController();
   TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/asset/cooking.jpg')
              ),
                color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Text("Tong's Restaurant",style: TextStyle(fontWeight: FontWeight.bold
          ,fontSize: 20
          ),),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Row(
              children: [
                Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Password"),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.height*0.06,
            child: CupertinoButton(
                color: Colors.blue,
                child: Text("Log In"), onPressed: ()async{
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text
                );
               // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                Get.offAll(HomeScreen());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            }),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(SignUpScreen());
            },
            child: Text("Don't Have An Account? Sign Up!"
            ,style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
