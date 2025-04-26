import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp1/main.dart';
import 'package:tp1/Homepage.dart';



class Signup extends StatefulWidget{
  const Signup({super.key});
  
  @override
  State<Signup> createState() => _SignupState();
  
}

class _SignupState extends State<Signup>{


TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController email= TextEditingController();
TextEditingController password = TextEditingController();


GlobalKey formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold( 
      body:  
      Container(child: Column(children: [
        const Text( 'Sign up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),),

                  const SizedBox(height: 40),

                  Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                    children: [
                      TextFormField(
                        controller: firstname,
                        decoration: const InputDecoration(
                        hintText: "First name",
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 1.5)
                        
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "must filled up";
                        } 
                      }),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: lastname,
                        decoration: const InputDecoration(
                        hintText: "Last name",
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 1.5)
                        
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "must filled up";
                        } 
                      }),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                        hintText: "Email",
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 1.5)
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "must filled up";
                        } 
                      }),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                        hintText: "Password",
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 1.5)
                        
                      ),
                      validator: (val) {
                        if (val!.isEmpty || val!.length <8) {
                          return "must filled up and upper than 8 caracters";
                        } 
                      }),

                      const SizedBox(height: 20,),

                      MaterialButton(onPressed: () async {
                        try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.of(context).pushNamed("home");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                           print('The account already exists for that email.');
                          }
                        } catch (e) {
                         print(e);
                        }
                      })

                    ],
                  )),
                  const SizedBox(height: 50,),

                      Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("Login");
                    },
                    child: const Text('Login page' , style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
      ],),),
      
),);
  }
}

    
      
    