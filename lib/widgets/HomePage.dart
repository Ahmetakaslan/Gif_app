import 'dart:convert';
import 'package:gif/classes/detail.dart';
import 'package:flutter/material.dart';
import 'package:gif/classes/GetData.dart';
import 'package:gif/classes/Gif.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String api = "buraya apinizi giriniz";
  String situation = "gülme";
  List<Gif>? data;
  bool isTrue = false;

  Future<void> getData() async {
    data = await GetData(api: "$api", situation: situation).fetchAlbum();
    print("datam =${data.runtimeType}");

    print(data![0].url);

    setState(() {
      Add();
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textGif = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: isTrue == false
            ? Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                        child: Text("Gif"),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            if (isTrue == false) {
                              setState(() {
                                isTrue = true;
                              });
                            } else {
                              isTrue = false;
                            }
                          });
                        },
                      ))
                ],
              )
            : Row(children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    onSubmitted: (value) {
                        setState(() {
                          if (isTrue == false) {
                            setState(() {
                              isTrue = true;
                            });
                          } else {
                            isTrue = false;
                          }

                          situation = textGif.text;
                          getData();
                        });
                    },
                    autofocus: true,
                    controller: textGif,
                    decoration: InputDecoration(
                        hintText:
                            "Anahtar kelime ile giriniz (örn= ağlama)"),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          if (isTrue == false) {
                            setState(() {
                              isTrue = true;
                            });
                          } else {
                            isTrue = false;
                          }

                          situation = textGif.text;
                          getData();
                        });
                      },
                    ))
              ]),
      ),
      // ignore: unnecessary_null_comparison
      body: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listem),
              ),
            ),
    );
  }

  List<Widget> listem = [];
  void Add() {
    listem.clear();
    setState(() {
         for (int i = 0; i < 8; i++) {
      listem.add(Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: data![i] == null
              ? CircularProgressIndicator()
              : GestureDetector(
                onTap: (){
                 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(a:data![i]),));
                },
                child: Image.network("${data![i].url}",))));
    }
    });
 
    
  }
}
