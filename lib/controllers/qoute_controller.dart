import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qotesapp/helpers/remote_services.dart';
import 'package:qotesapp/models/quote_model.dart';

class QuoteController extends GetxController{
  // void onInit() {
  //
  //   super.onInit();
  //   fetchData();
  // }

  final isFav=false.obs ;
  final index=0.obs;
   Rx isLoading=false.obs ;
  // QuoteModel? quotes;



  void toggleFav(){
    isFav.value=!isFav.value;

}

// void fetchData()async{
//     try{
//       isLoading(true);
//       QuoteModel quotesss=await RemoteServices().getQuote();
//       if(quotes!=null){
//         quotes=quotesss;
//
//
//       }
//     }
//    finally{
//       isLoading(false);
//    }
//
// }
}