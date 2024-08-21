import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/login.dart';

import 'package:get/get.dart';



class Forgotpass extends StatefulWidget{
  const Forgotpass({super.key});

  @override
  State createState(){
    return Forgot_Password();
  }
}

// ignore: camel_case_types
class Forgot_Password extends State{
  TextEditingController email=TextEditingController();
  signout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Reset Page')),
        elevation: 3,
      ),
      body: 
      Center(child: 
      Container(
        height: 100,
        width: 374,
        color: const Color.fromARGB(255, 183, 181, 174),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const TextField(
                  decoration: InputDecoration(label: Text('Enter Email')),
                ),),
                ElevatedButton(onPressed: (){}, child: Text('Get Link'))
            ]
          )
        ),
      )),
        floatingActionButton: FloatingActionButton(
      onPressed: (){
                        Get.to(const Home());
                      },
      child: const Icon(Icons.login_rounded)
      ,),
    );
  }
}
/*
Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Color.fromARGB(255, 207, 207, 206),
            child: Text('data'),
          ),
        ],
      ),),
*/