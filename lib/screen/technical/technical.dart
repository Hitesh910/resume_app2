import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class TechnicalScreen extends StatefulWidget {
  const TechnicalScreen({super.key});

  @override
  State<TechnicalScreen> createState() => _TechnicalScreenState();
}

class _TechnicalScreenState extends State<TechnicalScreen> {
  List<TextEditingController> txtList = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Technical skills",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Primary,
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Your is data saved"),
                  ),
                );
                for (var x in txtList) {
                  String data = x.text;
                  dataList.add(data);
                }
                print("$dataList");
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 5, spreadRadius: -1),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            15,
          ),

        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Enter your skills",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                    txtList.length,
                    (index) => Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // label: Text(
                                    //   "C Programming,Web Technical",
                                    //   style: TextStyle(
                                    //       color: Colors.grey,
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.w500),
                                    // ),
                                    hintText: "C programming,Web Technical",
                                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                                  ),
                                  controller: txtList[index],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (txtList.length != 1) {
                                    txtList.removeAt(index);
                                  }
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      txtList.add(TextEditingController());
                    });
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
