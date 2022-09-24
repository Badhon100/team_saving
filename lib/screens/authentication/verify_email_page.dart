import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyEmailPage extends StatefulWidget {
  VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isVerified){
      sendVerificationMail();
    }
    timer = Timer.periodic(Duration(seconds: 3), (timer) => checkEmailVerified());
    super.initState();
  }


  sendVerificationMail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
    user.sendEmailVerification();
    }on FirebaseAuthException catch (e){
      Fluttertoast.showToast(msg: e.message.toString());
    }


  }

  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isVerified) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isVerified ?
    const HomePage() :
     Scaffold(
      backgroundColor: const Color.fromARGB(137, 72, 72, 72),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "An email has been sent to your email.\n Click on the link and verify your email.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Text(
              "(It might go to your spam folder)",
              style: TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 87, 85, 85),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              sendVerificationMail();
            }, child: const Text("Resend email"))
          ],
        ),
      ),
    );
}