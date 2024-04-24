import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class DeclarationScreen extends StatefulWidget {
  const DeclarationScreen({super.key});

  @override
  State<DeclarationScreen> createState() => _DeclarationScreenState();
}

class _DeclarationScreenState extends State<DeclarationScreen> {
  bool isSelect = true;
  TextEditingController txtDespc = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtPlace = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Declaration",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Primary,
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Center(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 5,
              ),
            ], color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Declaration",
                      style: TextStyle(
                          color: Primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: isSelect,
                      onChanged: (value) {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      },
                    ),
                  ],
                ),
                Visibility(
                  visible: isSelect,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.add_task,
                        color: Colors.black,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        controller: txtDespc,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Description is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Date",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 150,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text(
                                        "DD/MM/YYYY",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    controller: txtDate,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Date is required";
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Place(Inteview/venue/city)",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text(
                                        "Eg.Surat",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    controller: txtPlace,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Place  is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              formKey.currentState!.reset();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Primary),
                              shape: MaterialStatePropertyAll(
                                LinearBorder.start(),
                              ),
                              fixedSize: const MaterialStatePropertyAll(
                                Size.fromWidth(120),
                              ),
                            ),
                            child: const Text(
                             "Clear",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Your data saved",
                                  ),
                                ),
                              );
                              if (formKey.currentState!.validate()) {
                                 despc = txtDespc.text;
                                date = txtDate.text;
                                place = txtPlace.text;
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Primary),
                              shape: MaterialStatePropertyAll(
                                LinearBorder.start(),
                              ),
                              fixedSize: const MaterialStatePropertyAll(
                                Size.fromWidth(120),
                              ),
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
