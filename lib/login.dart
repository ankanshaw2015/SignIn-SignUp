import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/forgotPass.dart';
//import 'package:flutter_application_4/forgotPass.dart';
import 'package:flutter_application_4/signUp.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHome();
  }
  
}
class MyHome extends State{
   TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      
      appBar: AppBar(title: const Center(child: Text('Log in Page', style: TextStyle(
        fontWeight: FontWeight.w600
      ),)),
      backgroundColor: const Color.fromARGB(221, 229, 230, 228),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              height: 300,
              width:300,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: const Color.fromARGB(221, 229, 230, 228), boxShadow: const [
                
              ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      
                      controller: email,
                      decoration: const InputDecoration(hintText: '@gmail',labelText: 'Email',fillColor: Colors.lightBlueAccent),
                    ),
                  ),
          
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: TextField(
                      obscuringCharacter: '*',
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(hintText: 'use combination',labelText: 'Password',fillColor: Colors.lightBlueAccent),
                                     ),
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){ Get.to(const Forgotpass());}, child: const Text('Forgot Password?'))
                    ],
                   ),
                   ElevatedButton(onPressed: (()=>signin())
                   ,
                   style: const ButtonStyle(backgroundColor:WidgetStatePropertyAll(Color.fromARGB(221, 229, 230, 228))), child: const Text('LogIn', style: TextStyle(fontWeight: FontWeight.w900),),
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not Registerd yet?'),
                      TextButton(onPressed: (){
                        Get.to(const Signup());
                      }, 
                      
                      child: const Text('Sign UP Now',style: TextStyle(color: Colors.blue),))
                    ],
                   )
                ],
              ),
            ),
          ],),
        ),
      ),
    );
  }
  signin()async{
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
                 }
  
}
