import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            try{
              await FirebaseAuth.instance.signOut();
            }on FirebaseAuthException catch (e){
              Fluttertoast.showToast(msg: e.message.toString());
            }
          },
          child: const Text("Logout", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}