import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController txtDegree = TextEditingController();
  TextEditingController txtCollege = TextEditingController();
  TextEditingController txtMarks = TextEditingController();
  TextEditingController txtYear = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(degree != null && college != null && marks != null && year != null)
      {
        txtDegree.text = degree!;
        txtCollege.text = college!;
        txtMarks.text = marks!;
        txtYear.text = year!;
      }
  }
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Education",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Primary,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(spreadRadius: -1, blurRadius: 5)],
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "College/Degree",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // label: Text(
                    //   "B.Tech Information Technology",
                    //   style: TextStyle(
                    //       color: Colors.grey, fontWeight: FontWeight.w500),
                    // ),
                    hintText: "B.tech Information Technology",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                  controller: txtDegree,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Degree is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "School/College/Institute",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // label: Text(
                    //   "Bhagwan Mahavir University",
                    //   style: TextStyle(
                    //       color: Colors.grey, fontWeight: FontWeight.w500),
                    // ),
                    hintText: "Bhagwan Mahavir University",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                  controller: txtCollege,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "College is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "School/College/Institute",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // label: Text(
                    //   "70% (or) 7.0 CGPA",
                    //   style: TextStyle(
                    //       color: Colors.grey, fontWeight: FontWeight.w500),
                    // ),
                    hintText: "70% (or) 7.0 CGPA",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                  controller: txtMarks,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Marks is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Year of Pass",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // label: Text(
                    //   "2019",
                    //   style: TextStyle(
                    //       color: Colors.grey, fontWeight: FontWeight.w500),
                    // ),
                    hintText: "2019",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                  controller: txtYear,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Year is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {
                      formKey.currentState!.reset();
                    }, child: const Text("Clear")),
                    const SizedBox(width: 15,),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your data is saved")));
                        if (formKey.currentState!.validate()) {
                          degree = txtDegree.text;
                          college = txtCollege.text;
                          marks = txtMarks.text;
                          year = txtYear.text;
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
