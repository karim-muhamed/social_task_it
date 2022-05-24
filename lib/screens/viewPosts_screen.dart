// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/night_mode.dart';
import 'editPost_screen.dart';

class ViewPostsScreen extends StatelessWidget {
  var checked;
  @override
  Widget build(BuildContext context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("View Posts"),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onDoubleTap: () {
                    print(document.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPostScreen(
                                path: document.id,
                                title: document["title"],
                                caption: document["caption"])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black, width: 0.7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.height * 0.01),
                          margin: EdgeInsets.all(size.height * 0.01),
                          decoration: BoxDecoration(
                            color: usertheme.getTheme() == ThemeData.dark()
                                ? Colors.black45
                                : Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            document['caption'],
                            style: TextStyle(
                                fontSize: 20,
                                height: 1.2,
                                color: usertheme.getTheme() == ThemeData.dark()
                                    ? Colors.white
                                    : Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.height * 0.015,
                            top: size.height * 0.01,
                            bottom: size.height * 0.01,
                          ),
                          child: Text(
                            document['title'],
                            style: const TextStyle(
                                fontSize: 22, color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
