import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_demo/screens/note/controller.dart';
import 'package:task_demo/utils/colors.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.action, required this.id});
  final String action;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New note",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          GetBuilder<NoteController>(
              init: NoteController(),
              builder: (controller) {
                return _DoneButton(
                  action: action,
                  id:id,
                  controller: controller,
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
                      Expanded(
                        child: TextField(
                            maxLines: null, controller: controller.textEditingController, keyboardType: TextInputType.multiline, decoration: null,autofocus: true,),
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
    required this.controller, required this.id,
  });

  final String action;
  final String id;
  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColors[2],
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              if (action == "Save") {
                controller.addDataToCollection();
              }else{
                controller.editDataToCollection(id);
              }
            },
            child: const Text("Save", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
