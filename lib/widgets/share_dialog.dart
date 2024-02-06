

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';

class ShareDialog{

  void openShareDialog(String sharedQuote){
    Get.dialog(
        AlertDialog(
          title: const Text("share to social media"),
          content: const Text("choose a social media platform to share within!"),
          actions: [
            TextButton(onPressed: (){
              Share.share(sharedQuote);
              Get.back();
            }
                , child: const Text("Facebook")),
            TextButton(onPressed: (){
              Share.share("shared quote");
              Get.back();
            },
                child: const Text("Twitter")),
          ],

        ));
  }
}
