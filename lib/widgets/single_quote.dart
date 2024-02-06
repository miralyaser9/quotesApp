import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:qotesapp/models/quote_model.dart';
import 'package:qotesapp/widgets/share_dialog.dart';
import 'package:share/share.dart';
import '../controllers/qoute_controller.dart';
import '../helpers/cloud_firestore.dart';
import '../views/home_page.dart';

class SingleQuote extends StatefulWidget {
   SingleQuote({Key? key,required this.quote,required this.authorName}) : super(key: key);

    final String quote;
    final String authorName;

  @override
  State<SingleQuote> createState() => _SingleQuoteState();
}

class _SingleQuoteState extends State<SingleQuote> {
  QuoteController quoteController=Get.put(QuoteController());

    bool isFav=false;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("${widget.quote}💚",overflow: TextOverflow.visible
              ,style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: "Monday Rain",fontSize: 22),
            ),
            const SizedBox(height: 30,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                     // quoteController.toggleFav();
                      isFav=!isFav;
                      setState(() {

                      });


                      CloudFirestore().addNewQuote(quote: QuoteModel(quote: widget.quote, authorName: widget.authorName));

                    }, icon: Icon(isFav?
                    Icons.favorite:Icons.favorite_border)
                    ),

                    IconButton(onPressed: (){
                      ShareDialog().openShareDialog(widget.quote);

                    }, icon: const Icon(Icons.share)),

                  ],),



            Text("by: ${widget.authorName}",style: TextStyle(fontWeight: FontWeight.bold),)

          ],

    ),
      );
  }

}
