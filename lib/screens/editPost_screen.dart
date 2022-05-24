// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/night_mode.dart';
import '../widgets/text_field.dart';

class EditPostScreen extends StatefulWidget {
  final String path;
  final String title;
  final String caption;
  const EditPostScreen(
      {Key? key,
      required this.path,
      required this.title,
      required this.caption})
      : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  var checked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title.toString();
    captionController.text = widget.caption.toString();
  }

  @override
  Widget build(BuildContext context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Edit Post"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              EdgeInsets.only(left: 20, right: 20, top: size.height * 0.05),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('data').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: usertheme.getTheme() == ThemeData.dark()
                            ? Colors.black
                            : Colors.blue),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('data')
                          .doc(widget.path)
                          .update({
                        'title': titleController.text,
                        'caption': captionController.text,
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Edit Post"),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
