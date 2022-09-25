import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!.email;
  TextEditingController nameController = TextEditingController();
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: ()async{
          try{
            await FirebaseAuth.instance.signOut();
            Get.off(()=> Login());
          }on FirebaseAuthException catch (e){
            Fluttertoast.showToast(msg: e.message.toString());
          }
          },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height*0.2),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80,
                child: InkWell(
                  onTap: (){

                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width*0.24, top: height*0.1),
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:width*0.1),
                child: Row(
                  children:  [
                    Expanded(
                      flex: 1,
                      child: const Text("Name: " , 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    (edit == false)?
                    Expanded(
                      flex: 4,
                      child: const Text("Nahiduzzaman Badhon" ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ):
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: height*0.08,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Enter your name"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width*0.05,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: height*0.05,
                        width: width*0.1,
                        decoration: BoxDecoration(
                          color: (edit == false)? Colors.orangeAccent : Colors.green,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(
                          onPressed: (){
                            print("object");
                          setState(() {
                            edit = !edit;
                          });
                          }, 
                          icon:(edit == false)? Icon(Icons.edit) : Icon(Icons.done)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:width*0.1),
                child: Row(
                  children: [
                    const Text("Email:" ,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    Text("$user" ,
                      style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}