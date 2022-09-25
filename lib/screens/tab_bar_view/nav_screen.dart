import 'package:firebase_project/screens/screens.dart';
import 'package:firebase_project/screens/tab_bar_view/account_list.dart';
import 'package:firebase_project/screens/tab_bar_view/profile_screen.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List tab = [
    const HomePage(),
    const AccountList(),
     ProfileScreen(),
  ];

  

  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      
      body: tab[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened ? 
          null :SizedBox(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: const Color(0xffF42A41),
            onPressed: (){
              setState(() {
              index = 0;
            });
            },
            child: const Icon(Icons.home,),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
           IconButton(onPressed: (){
            setState(() {
              index = 1;
            });
           }, icon: const Icon(Icons.menu_outlined, size: 40, color: Color(0xffF42A41),)),
           IconButton(onPressed: (){
            setState(() {
              index = 2;
            });
           }, icon: const Icon(Icons.person, size: 40, color: Color(0xffF42A41),))
          ],
        ),
      ),
    );
  }
}
