import 'dart:convert';
import 'package:app/firebase_options.dart';
import 'package:app/models/question_paper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController{
  @override
  void onReady(){
    uploadData();
    super.onReady();
  }

  void uploadData() async{
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String,dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path) => 
            path.startsWith("assets/DB/paper")&&path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for(var paper in papersInAssets){
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print('Items count ${questionPapers.length}');
  }
}