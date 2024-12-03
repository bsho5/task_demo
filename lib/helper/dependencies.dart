

import 'package:get/get.dart';
import 'package:task_demo/screens/note/controller.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => NoteController());

  //repo

}
