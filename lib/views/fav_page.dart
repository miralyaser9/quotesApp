import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qotesapp/helpers/cloud_firestore.dart';
import 'package:qotesapp/models/quote_model.dart';
import 'package:qotesapp/widgets/fav_quote.dart';
import 'package:qotesapp/widgets/single_quote.dart';

class FavPage extends StatelessWidget {
   FavPage({Key? key}) : super(key: key);

  // List<QuoteModel> quotess = [];
 //  CollectionReference quotes=FirebaseFirestore.instance.collection('quotes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("Your favourites 💚",style: TextStyle(color: Colors.black),),centerTitle: true,
    ),
      body:StreamBuilder<List<QuoteModel>>(

        stream: CloudFirestore().getQuotes(),
        builder: (context,AsyncSnapshot <List<QuoteModel>>snapshot){
          if(snapshot.data==null){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            //List<QuoteModel> quotesList = [];

            return ListView.builder(
              itemBuilder: (context,index){

              return FavQuote(quote: snapshot.data![index].quote, authorName: snapshot.data![index].authorName);


            },
              itemCount:snapshot.data!.length ,
            );

          }
          else if(snapshot.hasError)   {
            return Text('Error: ${snapshot.error}');
          }
          else{
            return Text("there was an error");
          }


        },
      )
    );
  }
}
