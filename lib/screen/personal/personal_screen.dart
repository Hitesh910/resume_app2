import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  bool isHindi = false;
  bool isEnglish = false;
  bool isGujarati = false;
  TextEditingController txtDob = TextEditingController();
  TextEditingController txtNationality = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String isSelected = "Single";

  @override
  void initState() {
    super.initState();
    if(dob != null && nationality != null)
      {
        txtDob.text = dob!;
        txtNationality.text != nationality!;
      }
  }
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Personal Details",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Primary,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                height: 40,
                child: const Text(
                  "Buid Option",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(spreadRadius: -1, blurRadius: 2)],
              borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DOB",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "DD/MM/YYYY",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  controller: txtDob,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "DOB is required";
                    }
                  },
                ),
                Text(
                  "Marital Status",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                // Row(
                //   children: [
                //     Radio(
                //       value: "Single",
                //       groupValue: isSelected,
                //       onChanged: (value) {
                //         setState(() {
                //           isSelected = value!;
                //         });
                //       },
                //     ),
                //     Text(
                //       "Single",
                //       style: TextStyle(fontSize: 18),
                //     )
                //   ],
                // ),
                // Row(
                //   children: [
                //     Radio(
                //       value: "Marrid",
                //       groupValue: isSelected,
                //       onChanged: (value) {
                //         setState(() {
                //           isSelected = value!;
                //         });
                //       },
                //     ),
                //     Text(
                //       "Married",
                //       style: TextStyle(fontSize: 18),
                //     )
                //   ],
                // ),
                RadioListTile(
                  value: "Single",
                  groupValue: isSelected,
                  onChanged: (value) {
                    setState(
                      () {
                        isSelected = value!;
                        marriedstatus = value;
                      },
                    );
                  },
                  title: const Text(
                    "Single",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                RadioListTile(
                  value: "Married",
                  groupValue: isSelected,
                  onChanged: (value) {
                    setState(
                      () {
                        isSelected = value!;
                        marriedstatus = value;
                      },
                    );
                  },
                  title: const Text(
                    "Married",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  "Language Known",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                // Row(
                //   children: [
                //     Checkbox(value: isHindi, onChanged: (value) {
                //       setState(() {
                //         isHindi = value!;
                //       });
                //     },
                //     ),
                //     Text("Hindi",style: TextStyle(fontSize: 18),)
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(value: isEngish, onChanged: (value) {
                //       setState(() {
                //         isEngish = value!;
                //       });
                //     },
                //     ),
                //     Text("English",style: TextStyle(fontSize: 18),)
                //   ],
                // ),
                CheckboxListTile(
                  value: isHindi,
                  onChanged: (value) {
                    setState(() {
                      isHindi = value!;
                      if(isHindi)
                        {
                          lng1 = "Hindi";
                        }
                    });
                  },
                  title: const Text(
                    "Hindi",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: isEnglish,
                  onChanged: (value) {
                    setState(() {
                      isEnglish = value!;
                      if(isEnglish)
                        {
                          lng2 = "English";
                        }
                    });
                  },
                  title: const Text(
                    "English",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: isGujarati,
                  onChanged: (value) {
                    setState(() {
                      isGujarati = value!;
                      if(isGujarati)
                        {
                          lng3 = "Gujarati";
                        }
                    });
                  },
                  title: const Text(
                    "Gujarati",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Text(
                  "Nationality",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Indian",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  controller: txtNationality,
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Nationalty is required";
                      }
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        fromKey.currentState!.reset();
                      },
                      child: Text("Clear"),
                    ),
                    SizedBox(width: 15,),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your data is saved")));
                        if (fromKey.currentState!.validate()) {
                          dob = txtDob.text;
                          nationality = txtNationality.text;
                        }
                      },
                      child: Text("Save"),
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
