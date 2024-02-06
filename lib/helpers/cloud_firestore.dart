import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qotesapp/models/quote_model.dart';

class CloudFirestore{


  CollectionReference quotes=FirebaseFirestore.instance.collection('quotes');


  Future<void> addNewQuote({required QuoteModel quote})async{

    return quotes
        .add({
      "quoteName":quote.quote,
      "authorName":quote.authorName,
    })
        .then((value) => print("quote added")
    )
        .catchError((error) => print("Failed to add quote: $error"));
  }

  Stream<List<QuoteModel>> getQuotes() {
    return quotes
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return QuoteModel(
          quote: doc['quoteName'],
          authorName: doc['authorName'],


        );

      }).toList();

    });

  }
}