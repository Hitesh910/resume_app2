import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/app_color.dart';

class AchivementScreen extends StatefulWidget {
  const AchivementScreen({super.key});

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {
  List<TextEditingController> txtList = [TextEditingController()];
  List<String> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Achievement",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Primary,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(content: Text("Your data saved"),),);
                for (var z in txtList) {
                  String data = z.text;
                  dataList.add(data);
                }
                print("$dataList");
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: -1,
            ),
          ], color: Colors.white),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Enter Achievements",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                  children: List.generate(
                      txtList.length,
                      (index) => Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // label: Text("Exceeded sales 17% average",style: TextStyle(color: Colors.grey),),
                                        hintText: "Exceeded sales 17% average",
                                        hintStyle: TextStyle(color: Colors.grey)
                                      ),
                                      controller: txtList[index],
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      txtList.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 40,
                                  ))
                            ],
                          ))),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      txtList.add(TextEditingController());
                    });
                  },
                  child: const Text("Add")),
            ],
          ),
        ),
      ),
    );
  }
}
