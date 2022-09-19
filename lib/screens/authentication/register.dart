import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 72, 72, 72),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              height: height*0.1,
              width: width*0.7,
              labelText: "Email",
              emailController: emailController
              ),
              CustomTextField(
              height: height*0.1,
              width: width*0.7,
              labelText: "Password",
              obscureText: true,
              emailController: passwordController
              ),
              CustomTextField(
              height: height*0.1,
              width: width*0.7,
              labelText: "Confirm Password",
              obscureText: true,
              emailController: confirmPasswordController
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Alredy have an account?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                TextButton(
                  onPressed: (){
                    Get.to(()=> Login());
                  }, 
                  child: const Text("Login"))
              ],
            ),
            ElevatedButton(
              onPressed: ()async{
                if(passwordController == confirmPasswordController){
                  
                    await FirebaseAuth.instance.
                    createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                  
                }
                else{
                  Fluttertoast.showToast(msg: "Passowrd doesn't match");
                }
                  
                
              },
              child: const Text("Register", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

