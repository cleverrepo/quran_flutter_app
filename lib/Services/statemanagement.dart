
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:islamversehub/Services/apiclass.dart';
class FavoriteProvider extends ChangeNotifier{
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  List<Ayah> favorite=[];

 Future<void> toggle(Ayah ayah) async {
   ayah.isFavorite=!ayah.isFavorite;
   if(ayah.isFavorite){
     favorite.remove(ayah);
   }else{
     favorite.add(ayah);
   }
   notifyListeners();
   await loadFavorite(ayah);
 }
  Future<void> loadFavorite(Ayah ayah)async{
    try{
     await firestore.collection("quran").doc(ayah.text).set({
        "favorite":ayah.isFavorite
      });
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
  }
}