import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

import 'package:task_demo/screens/note/controller.dart';
import 'package:task_demo/screens/note/view.dart';

import '../../utils/colors.dart';
import '../../utils/custom_grid.dart';
import '../search/view.dart';

class Home extends StatelessWidget {
  const Home({required this.height, super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton:   FloatingActionButton(
          onPressed: () {
            Get.find<NoteController>().textEditingController.clear();
            Get.to(() => const Note(action: "Save", id: ''));
          },
          child: const Icon(Icons.note_outlined, color: Colors.white, size: 40),
        ),
      //const _ExpandableFab(),
      body: SafeArea(
        child: GetBuilder<NoteController>(
            init: NoteController(),
            builder: (controller) {
              return controller.isLoading
                  ? const _LoadingWidget()
                  : controller.notes.isEmpty
                      ? const _EmptyWidget()
                  : _Body(
                      height: height,
                      controller: controller,
                    );
            }),
      ),
    );
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        // backgroundColor: Colors.green,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Colors.white,
        // backgroundColor: Colors.lightGreen,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton(
          onPressed: () {
            Get.find<NoteController>().textEditingController.clear();
            Get.to(() => const Note(action: "Save", id: ''));
          },
          child: const Icon(Icons.note_outlined, color: Colors.white, size: 40),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.list, color: Colors.white, size: 40),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.height,
    required this.controller,
  });
  final NoteController controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Search(),
        SizedBox(height: 20,),
     
        Expanded(
          child: SizedBox(
              // height: height - 150,
              child: GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12.0),
            gridDelegate: CustomGridDelegate(dimension: 160.0),

            itemCount: controller.notes.length, // The default is that the number of grid tiles is infinite.

            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: InkWell(
                  onTap: () {
                    controller.textEditingController.text = controller.notes[index].body ?? '';
                    Get.to(() => Note(action: "Edit", id: controller.notes[index].id ?? ''));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(12.0),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: appColors[index % 5]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.title(controller.notes[index].body ?? ""),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.notes[index].body ?? "",
                          style: const TextStyle(color: Colors.black, fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ),
       
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: appColors[3],
    ));
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You dont have Any notes yet (^ _ ^)!!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
