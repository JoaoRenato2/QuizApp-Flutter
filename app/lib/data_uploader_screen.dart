import 'package:app/controllers/question_paper/data_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("uploading"),),
    );
  }
}