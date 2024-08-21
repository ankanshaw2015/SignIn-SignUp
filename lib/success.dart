
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*
class Success extends StatelessWidget{
   Success({super.key});

  final user = FirebaseAuth.instance.currentUser;

  signout() async{
    await FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      
      appBar: AppBar(title: const Center(child: Text('Log in Page', style: TextStyle(
        fontWeight: FontWeight.w600
      ),)),
      backgroundColor: const Color.fromARGB(221, 229, 230, 228),),
      body: const Center(child: Text("Successfull"),),
      
      floatingActionButton: FloatingActionButton(
      onPressed: (() => signout()),
      child: const Icon(Icons.login_rounded)
      ,),

      );
  }
}*/

import 'dart:convert';

import 'package:flutter/services.dart';



class Success extends StatefulWidget {
  const Success({super.key});

 

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {

   List _allUsers = [];
  

  // This list holds the data for the list view
  List _foundUsers = [];
 
  @override
  initState() {
    readData();
   
    super.initState();
  }

  // This function is called whenever the te
  //xt field changes
  void _runFilter(String enteredKeyword) {
    
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers=results;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You are Loged in'),
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Center(
              child: Expanded(child: ElevatedButton(onPressed: () async{
    await FirebaseAuth.instance.signOut();
  },
              child:const Text('logOut') ,)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: const Color.fromARGB(255, 201, 202, 203),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color:Color.fromARGB(255, 20, 22, 21), fontWeight: FontWeight.w700),
                    ),
                    title: Text(_foundUsers[index]['name'], style:const TextStyle(
                      color:Color.fromARGB(255, 247, 100, 151)
                    )),
                    subtitle: Text(
                        '${_foundUsers[index]["age"].toString()} years old',style:const TextStyle(
                        color:Color.fromARGB(255, 3, 78, 113)
                    )),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future readData() async{
    String  response= await rootBundle.loadString('assests/sample.json');
 final data = await jsonDecode(response);
  
  
    setState(() {
       _allUsers=data['items'];
    _foundUsers = _allUsers;
    });
  }
}
