import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todos = [];
  bool loading = true;
  String input = "";
  final textEditingController = TextEditingController();
  String errtxt = "";
  bool vadlidate = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
    todos.add("Analyze The survey results");
    todos.add("Service a car");
    todos.add("Publish App On Monday");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TO-DO"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child:
              // ? Center(
              //     child: CircularProgressIndicator(),
              //   ):
              ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                onDismissed: (direction) {
                  setState(() {
                    todos.removeAt(index);
                  });
                },
                key: Key(todos[index]),
                child: Card(
                  margin: EdgeInsets.all(8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            textEditingController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Add TODO"),
                      content: TextField(
                        controller: textEditingController,
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (textEditingController.text.length <= 5) {
                              setState(() {
                                Fluttertoast.showToast(
                                    msg:
                                        " TO-DO should have minimum 5 characters");
                              });
                            } else {
                              setState(() {
                                todos.add(input);
                                vadlidate = true;
                                errtxt = "";
                              });
                            }

                            Navigator.pop(context);
                          },
                          child: Text("add".toUpperCase()),
                        ),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
