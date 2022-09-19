import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                TextButton(
                  onPressed: (){
                    Get.to(()=> Register());
                  }, 
                  child: const Text("Register"))
              ],
            ),
            ElevatedButton(
              onPressed: ()async{
                await FirebaseAuth.instance.
                signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
              },
              child: const Text("Login", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

