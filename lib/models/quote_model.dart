class QuoteModel{
  final String quote;
  final String authorName;
  QuoteModel({required this.quote,required this.authorName});


  factory QuoteModel.fromJson(jsonData){
   return QuoteModel(quote: jsonData['quote'],authorName: jsonData['author']);
  }
}

