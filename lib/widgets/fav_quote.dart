import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavQuote extends StatelessWidget {
   FavQuote({Key? key,required this.quote,required this.authorName}) : super(key: key);
String quote;
String authorName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(

        decoration: const BoxDecoration( gradient: LinearGradient(begin: Alignment.topLeft,end:
      Alignment.bottomCenter,
          colors: [Colors.green,Colors.white]
      ),
          borderRadius: BorderRadius.all( Radius.circular(16)
          )),


        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
          Text("${quote}💚",overflow: TextOverflow.visible
            ,style: const TextStyle(fontWeight: FontWeight.bold),
          ),
              const SizedBox(height: 15,),
              Text("by:$authorName",style: const TextStyle(fontWeight: FontWeight.bold,)),

            ]
          ),
        ),
      ),
    );
  }
}
