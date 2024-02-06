import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qotesapp/controllers/qoute_controller.dart';
import 'package:qotesapp/widgets/single_quote.dart';
import '../helpers/remote_services.dart';
import '../models/quote_model.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  QuoteModel? quote;

  bool isLoading=false;

  QuoteController quoteController=Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: AppBar(elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Quote of the day !',style: TextStyle(color: Colors.black),),centerTitle: true,
      ),body:


    Container(
      decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage(
        "https://i.pinimg.com/564x/af/45/ee/af45ee87c6fefc4ce6d42e6ab559396e.jpg"),
    fit: BoxFit.fill,opacity: 0.5)
    )
      ,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  IconButton(onPressed: (){
                    fetchData();
                  }, icon: const Icon(Icons.refresh)),
                  Container(
                      height: height*0.4,
                      width: 400,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topLeft,end:
                          Alignment.bottomCenter,
                              colors: [Colors.green,Colors.white]
                          ),
                          borderRadius: BorderRadius.all( Radius.circular(16)
                          )
                      ),
                      child:
                      isLoading?const Center(child: CircularProgressIndicator()):quote!=null?

                      SingleQuote(quote:quote!.quote, authorName: quote!.authorName ,):Text("failed to fetch quote")


                  ),
                ],
              ),
            ),
          ),

        ],),
    ),

    );
  }

  void fetchData()async{
    setState(() {
      isLoading=true;
    });

    QuoteModel quotesss=await RemoteServices().getQuote();
    setState(() {
      quote=quotesss;
      isLoading=false;
    });



  }

}

