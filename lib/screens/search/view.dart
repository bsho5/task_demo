
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/note/controller.dart';
import 'package:task_demo/screens/note/view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _isOpened = false;
 
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: _isOpened ? 280 : 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, top: 3.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOpened = !_isOpened;
                      });
                    },
                    child: TextFormField(
                      controller: _controller,
                      enabled: _isOpened ? true : false,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //  setState(() {
                        //    print(keyboardHeight);
                        //     _isOpened = !_isOpened;
                        //   });
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isOpened = true;
                          });
                        } else {
                          setState(() {
                            _isOpened = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 10.0),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Search notes",
                        hintStyle: const TextStyle(color: Colors.grey,fontSize: 12),
                        prefixIcon: const AnimatedOpacity(
                          duration: Duration(milliseconds: 700),
                          opacity:  1,
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_controller.text.isNotEmpty)
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                      _isOpened = !_isOpened;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              const SizedBox(width: 10.0),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.filter_list,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          
                          _isOpened = false;
                        });
                      },
                    ),
                  ),
                ),
                if (_isOpened)
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.search(_controller.text).length,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.textEditingController.text = controller.notes[index].body ?? '';
                                Get.to(() => Note(action: "Edit", id: controller.notes[index].id ?? ''));
                              },
                              child: ListTile(
                                title: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 700),
                                  opacity: _controller.text == controller.search(_controller.text)[index] ? 1 : 0.5,
                                  child: Text(
                                    _controller.text == controller.search(_controller.text)[index]
                                        ? controller.search(_controller.text)[index]
                                        : controller.search(_controller.text)[index],
                                    style: TextStyle(
                                      color: _controller.text == controller.search(_controller.text)[index] ? Colors.grey.shade100 : Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                leading: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 700),
                                  opacity: _controller.text == controller.search(_controller.text)[index] ? 1 : 0.5,
                                  child: Icon(
                                    Icons.search,
                                    color: _controller.text == controller.search(_controller.text)[index] ? Colors.grey.shade100 : Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
