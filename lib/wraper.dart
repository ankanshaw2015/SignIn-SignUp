import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/login.dart';
import 'package:flutter_application_4/success.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
       builder:(context, snapshot)
       {
          if(snapshot.hasData){
            //print(snapshot);
            return Success();
          }
          else{
            return const Home();
          }
       }),
    );
  }
}






/*
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State createState() {
    return MyWrapper();
  }
}

class MyWrapper extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Success();
          }
        },
      ),
    );
  }
}*/
