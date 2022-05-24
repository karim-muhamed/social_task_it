// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/night_mode.dart';
import '../widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPostScreen extends StatefulWidget {
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  var checked;

  // XFile? _image;
  //
  // late final location;
  //
  // _imgFromDevice({ImageSource? imageSource}) async {
  //   XFile? image =
  //       await ImagePicker().pickImage(source: imageSource!, imageQuality: 50);
  //   if (image != null) {
  //     setState(() {
  //       _image = image;
  //       print("image is ${image.path}");
  //       File file = File(_image!.path);
  //       uploadPic(file);
  //     });
  //   } else {
  //     return;
  //   }
  // }
  //
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  //
  // Future uploadPic(File file) async {
  //   //Create a reference to the location you want to upload to in firebase
  //   Reference reference = _storage.ref().child("assets3.jpeg");
  //
  //   //Upload the file to firebase
  //    reference.putFile(file);
  // }
  @override
  Widget build(BuildContext context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Post"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: size.height * 0.05),
        child: Column(
          children: [
            TxtFieldWidget(
              textEditingController: titleController,
              hint: "Title",
              lines: 1,
            ),
            TxtFieldWidget(
              textEditingController: captionController,
              hint: "Caption",
              lines: 6,
            ),
            // _image != null
            //     ? Container(
            //         alignment: Alignment.center,
            //         margin: EdgeInsets.only(bottom: size.height * 0.05),
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10.0),
            //             border: Border.all(color: Colors.black, width: 0.7)),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(10.0),
            //           child: Image.file(
            //             File(_image!.path),
            //             fit: BoxFit.fill,
            //             height: size.height * 0.4,
            //             width: double.infinity,
            //           ),
            //         ),
            //       )
            //     : Container(
            //         height: size.height * 0.4,
            //         alignment: Alignment.center,
            //         margin: EdgeInsets.only(bottom: size.height * 0.05),
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10.0),
            //             border: Border.all(color: Colors.black, width: 0.7)),
            //         child: GestureDetector(
            //           onTap: () {
            //             showModalBottomSheet(
            //                 context: context,
            //                 backgroundColor: Colors.transparent,
            //                 builder: (builder) {
            //                   return Container(
            //                     decoration: const BoxDecoration(
            //                         color: Colors
            //                             .grey, //new Color.fromRGBO(255, 0, 0, 0.0),
            //                         borderRadius: BorderRadius.only(
            //                             topLeft: Radius.circular(20.0),
            //                             topRight: Radius.circular(20.0))),
            //                     child: bottomSheet(context),
            //                   );
            //                 });
            //           },
            //           child: Icon(Icons.camera_alt,
            //               size: 25, color: Colors.black.withOpacity(0.7)),
            //         ),
            //       ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: usertheme.getTheme() == ThemeData.dark()
                      ? Colors.black
                      : Colors.blue),
              onPressed: () {
                FirebaseFirestore.instance.collection('data').add({
                  'title': titleController.text,
                  'caption': captionController.text,
                });
                Navigator.pop(context);
              },
              child: const Text("Save Post"),
            ),
          ],
        ),
      ),
    );
  }
  // Widget bottomSheet(BuildContext context) {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         const Text(
  //           "Choose Photo For The Post",
  //           style: TextStyle(
  //             fontSize: 16.0,
  //             //    fontFamily: lunBold,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 18,
  //         ),
  //         Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {
  //                   _imgFromDevice(imageSource: ImageSource.camera);
  //                   Navigator.pop(context);
  //                 },
  //                 child: Row(
  //                   children: const [
  //                     Icon(
  //                       Icons.camera_alt,
  //                       size: 30,
  //                       color: Colors.white,
  //                     ),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Text(
  //                       "Camera",
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         //  fontFamily: lunRegular,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 width: 2,
  //                 color: Colors.white,
  //                 height: 30,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   _imgFromDevice(imageSource: ImageSource.gallery);
  //                   Navigator.pop(context);
  //                 },
  //                 child: Row(
  //                   children: const [
  //                     Icon(Icons.image, color: Colors.white, size: 30),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Text(
  //                       "Gallery",
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         //  fontFamily: lunRegular,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ])
  //       ],
  //     ),
  //   );
  // }
}
