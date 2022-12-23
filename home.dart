

import 'package:flutter/material.dart';
import 'package:firstapp/app.dart';
import 'package:firstapp/login.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  List<dynamic> names=['Omer',"Mohsin","Shaheer","Faisal","Nouman","Usman"];
  var output="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder:(context, index){
          return Container(
            height: 50,
            margin: EdgeInsets.only(top: 10),
            color: Colors.blue,
            child: ListTile(
              title: Text("${names[index]}"),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (builder){
                          return AlertDialog(
                            title: Text("Update item"),
                            content: TextField(
                              onChanged:(value){
                                output=value;
                              },
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.of(context).pop();
                                setState(() {
                                  names.replaceRange(index, index+1, {output});
                                });
                              }, child: Text('update'))
                            ],

                          );
                        });


                      },
                        child: Icon(Icons.update)),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            names.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete)),
                  ],
                ),
              ),

            ),
          );
        }),
      floatingActionButton: FloatingActionButton(onPressed:(){
        showDialog(context: context, builder: (builder){
          return AlertDialog(
            title: Text("Add item"),
            content: TextField(
              onChanged:(value){
                output=value;
              },
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                setState(() {
                  names.add(output);
                });
              }, child: Text('add'))
            ],

          );
        });
      } ,child: Text("Add"),),

    );
  }
}




