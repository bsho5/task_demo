// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_demo/screens/note/controller.dart';
// import 'package:task_demo/screens/note/view.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   bool _isOpened = false;
//   bool _enabled = true;

//   final TextEditingController _controller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
//     return GetBuilder<NoteController>(builder: (controller) {
//       return KeyboardVisibilityProvider(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 800),
//             curve: Curves.easeInOut,
//             height:  isKeyboardVisible ? 280 : 55,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(30.0)),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 3.0, top: 3.0),
//                     child: TextFormField(
//                       key: _formKey,
//                       controller: _controller,
//                       // enabled: _enabled,
//                       // autofocus: _enabled,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                       onChanged: (value) {
//                         if (value.isNotEmpty) {
//                           _isOpened = true;
//                           controller.update();
//                         } else {
//                           _isOpened = false;
//                           controller.update();
//                         }
//                       },
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.only(top: 10.0),
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                         hintText: "Search notes",
//                         hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
//                         prefixIcon: const AnimatedOpacity(
//                           duration: Duration(milliseconds: 700),
//                           opacity: 1,
//                           child: Icon(Icons.search, color: Colors.grey),
//                         ),
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               if (_controller.text.isNotEmpty)
//                                 IconButton(
//                                   onPressed: () {
//                                     // setState(() {

//                                     // });
//                                     _controller.clear();
//                                     _isOpened = !_isOpened;
//                                     controller.update();
//                                   },
//                                   icon: const Icon(
//                                     Icons.close,
//                                     size: 20,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               const SizedBox(width: 10.0),
//                               Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white24,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     _enabled = !_isOpened;
//                                     _isOpened = !_isOpened;
//                                     print("enable : $_enabled");
//                                     print("open : $_isOpened");
//                                     print(MediaQuery.of(context).viewInsets.bottom);
//                                     controller.update();
//                                   },
//                                   child: Icon(
//                                     _isOpened ? Icons.cancel : Icons.filter_list,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           _isOpened = true;
//                           _enabled = true;
//                           print("in tap");
//                         });
//                       },
//                       // onFieldSubmitted: (value) {
//                       //   // setState(() {

//                       //   // });
//                       //   _isOpened = false;
//                       //   controller.update();
//                       // },
//                     ),
//                   ),
//                   if (isKeyboardVisible)
//                     SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: controller.search(_controller.text).length,
//                         scrollDirection: Axis.vertical,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               controller.textEditingController.text = controller.searchableNotes[index].body ?? '';
//                               Get.to(() => Note(action: "Edit", id: controller.notes[index].id ?? ''));
//                             },
//                             child: ListTile(
//                               title: AnimatedOpacity(
//                                 duration: const Duration(milliseconds: 700),
//                                 opacity: _controller.text == controller.search(_controller.text)[index] ? 1 : 0.5,
//                                 child: Text(
//                                   _controller.text == controller.search(_controller.text)[index]
//                                       ? controller.search(_controller.text)[index]
//                                       : controller.search(_controller.text)[index],
//                                   style: TextStyle(
//                                     color: _controller.text == controller.search(_controller.text)[index] ? Colors.grey.shade100 : Colors.grey,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               leading: AnimatedOpacity(
//                                 duration: const Duration(milliseconds: 700),
//                                 opacity: _controller.text == controller.search(_controller.text)[index] ? 1 : 0.5,
//                                 child: Icon(
//                                   Icons.search,
//                                   color: _controller.text == controller.search(_controller.text)[index] ? Colors.grey.shade100 : Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/note/controller.dart';
import 'package:task_demo/screens/note/view.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _isOpened = false;
  bool _enabled = true;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((isVisible) {
      if (!isVisible) {
        FocusScope.of(context).unfocus(); // Unfocus when the keyboard is closed
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    return GetBuilder<NoteController>(builder: (controller) {
      return KeyboardVisibilityProvider(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Dismiss keyboard when tapping outside
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              height: isKeyboardVisible ? 280 : 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, top: 3.0),
                      child: TextFormField(
                        key: _formKey,
                        controller: _controller,
                        focusNode: _focusNode,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        onChanged: (value) {
                          _isOpened = value.isNotEmpty;
                          controller.update();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search notes",
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                          prefixIcon: const AnimatedOpacity(
                            duration: Duration(milliseconds: 700),
                            opacity: 1,
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
                                      _controller.clear();
                                      _isOpened = false;
                                      controller.update();
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
                                  child: InkWell(
                                    onTap: () {
                                      if (_focusNode.hasFocus) {
                                        _focusNode.unfocus();
                                      } else {
                                        _focusNode.requestFocus();
                                      }
                                      controller.update();
                                    },
                                    child: Icon(
                                      _focusNode.hasFocus ? Icons.cancel : Icons.filter_list,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _isOpened = true;
                            _enabled = true;
                          });
                        },
                      ),
                    ),
                    if (isKeyboardVisible)
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
                                controller.textEditingController.text = controller.searchableNotes[index].body ?? '';
                                Get.to(() => Note(action: "Edit",title: controller.title(controller.searchableNotes[index].body??''), id: controller.notes[index].id ?? ''));
                              },
                              child: ListTile(
                                title: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 700),
                                  opacity: _controller.text == controller.search(_controller.text)[index] ? 1 : 0.5,
                                  child: Text(
                                    controller.search(_controller.text)[index],
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
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
