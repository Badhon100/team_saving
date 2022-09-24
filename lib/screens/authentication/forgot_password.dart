import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/authentication/login.dart';
import 'package:firebase_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

@override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController, 
              labelText: "Email", 
              height: height*0.1, 
              width: width*0.7
            ),
            ElevatedButton(
              onPressed: ()async{
                
                 try{
                   await FirebaseAuth.instance.
                  sendPasswordResetEmail(email: emailController.text.trim());
                  Fluttertoast.showToast(msg: "Email has been sent");
                  Get.off(()=> Login());  
                 }on FirebaseAuthException catch(e){
                  Fluttertoast.showToast(msg: e.message.toString());
                 }
                
              },
              child: const Text("Send", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      )
    );
  }
}