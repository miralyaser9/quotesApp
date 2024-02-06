import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qotesapp/controllers/qoute_controller.dart';
import 'package:qotesapp/views/fav_page.dart';
import 'package:qotesapp/views/home_page.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({Key? key}) : super(key: key);

   QuoteController quoteController =Get.put(QuoteController());

  List<Widget> screens=[HomePage(),FavPage()];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        body: screens[quoteController.index.value],

        bottomNavigationBar:
           BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home page'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),label:
              'Favourites'),

            ],
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.black,
             selectedIconTheme: const IconThemeData(size: 30),
             currentIndex: quoteController.index.value,

             onTap: (i){
              quoteController.index.value=i;
             },
          ),


      ),
    );
  }
}
