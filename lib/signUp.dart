import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/wraper.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget{
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
  
}

class SignUpPage extends State{
  TextEditingController email=TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text('Sign Up Page')), ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 130,
                child: Column(children: [
                  TextField(
                    controller: email,
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5),), )
                    ),
                  ),
                  const SizedBox(height: 10,),
                   TextField(
                    controller: password,
                    
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      suffix: Icon(Icons.remove_red_eye),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5),), )
                    ),
                  )
                ],
                ),
              ),
              ElevatedButton(onPressed: signUp, child: const Text('SignUp'))
          ],
          
          ),
        ),
    );
  }

  signUp()async{
   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
   Get.offAll(const Wrapper());
  }
  
}