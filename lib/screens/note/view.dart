import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/note/controller.dart';
import 'package:task_demo/utils/colors.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.action, required this.id, required this.title});
  final String action;
  final String id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.find<NoteController>().getDataOnce();
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title:  Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        actions: [
          GetBuilder<NoteController>(
              init: NoteController(),
              builder: (controller) {
                return Row(
                  children: [
                    title == "New note"
                        ? SizedBox(
                            width: 0,
                          )
                        : _DoneButton(
                            status: "Delete",
                            action: action,
                            id: id,
                            controller: controller,
                          ),
                    //SizedBox(width: 5,),
                    _DoneButton(
                      status: "Save",
                      action: action,
                      id: id,
                      controller: controller,
                    ),
                  ],
                );
              })
        ],
      ),
      body: GetBuilder<NoteController>(
          init: NoteController(),
          builder: (controller) {
            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      // TextField(controller: controller.textEditingController,m),
                      TextField(
                        maxLines: null,
                        controller: controller.textEditingController,
                        keyboardType: TextInputType.multiline,
                        decoration: null,
                        autofocus: true,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({
    super.key,
    required this.action,
    required this.controller,
    required this.id,
    required this.status,
  });

  final String action;
  final String status;
  final String id;
  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 30,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: status == "Delete" ? Colors.redAccent : appColors[2],
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              if (status == "Delete") {
                controller.deleteDataToCollection(id);
              }
              {
                if (action == "Save") {
                  controller.addDataToCollection();
                } else {
                  controller.editDataToCollection(id);
                }
              }
            },
            child: Text(status, style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
