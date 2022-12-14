
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/screens/authentication/verify_email_page.dart';
import 'package:firebase_project/screens/tab_bar_view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/screens.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: ProfileScreen(),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return const Center(
      //         child: CircularProgressIndicator()
      //       );
      //     }else if(snapshot.hasError){
      //       return const Center(
      //         child: Text("something went wrong"),
      //       );
      //     }else if(snapshot.hasData){
      //       return  VerifyEmailPage();
      //     }else{
      //       return Login();
      //     }
      //   }
      // ),
    );
  }
}


