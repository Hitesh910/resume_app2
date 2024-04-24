import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class ExperiencesScreen extends StatefulWidget {
  const ExperiencesScreen({super.key});

  @override
  State<ExperiencesScreen> createState() => _ExperiencesScreenState();
}

class _ExperiencesScreenState extends State<ExperiencesScreen> {
  String isChoice = "Previously Employed";
  TextEditingController txtCname = TextEditingController();
  TextEditingController txtIname = TextEditingController();
  TextEditingController txtRoles = TextEditingController();
  TextEditingController txtJoined = TextEditingController();
  TextEditingController txtExits = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Experince",
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
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: -1,
              ),
            ], borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company Name",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // label: Text(
                        //   "New Enterprise,San Francisco",
                        //   style: TextStyle(color: Colors.grey, fontSize: 18),
                        // ),
                        hintText: "New Enterprise,San Francisco",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                    controller: txtCname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Company name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "School/Collage/Institute",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // label: Text(
                        //   "Quality Test Engineer",
                        //   style: TextStyle(color: Colors.grey, fontSize: 18),
                        // ),
                        hintText: "Quality Test Engineer",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                    controller: txtIname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Institute name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Roles (optinal)",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // label: Text(
                        //   "Quality Test Engineer",
                        //   style: TextStyle(color: Colors.grey, fontSize: 18),
                        // ),
                        hintText: "Quality Test Engineer",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                    controller: txtRoles,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Employee Status",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: "Previously Employed",
                        groupValue: isChoice,
                        onChanged: (value) {
                          setState(() {
                            isChoice = value!;
                          });
                        },
                        title: Text(
                          "Previously Employed",
                          style: TextStyle(color: Primary, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: "Currently Employed",
                        groupValue: isChoice,
                        onChanged: (value) {
                          setState(() {
                            isChoice = value!;
                          });
                        },
                        title: Text(
                          "Currently Employed",
                          style: TextStyle(color: Primary, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Date Joined",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          width: 110,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  "DD/MM/YYYY",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                              controller: txtJoined,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Date is required";
                                }
                                return null;
                              }),
                        )
                      ],
                    ),
                    Visibility(
                      visible: isChoice == "Previously Employed",
                      child: Column(
                        children: [
                          const Text(
                            "Date Exits",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 110,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  "DD/MM/YYYY",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                              controller: txtExits,
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
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                      },
                      style: ButtonStyle(
                          shape:
                              const MaterialStatePropertyAll(LinearBorder.none),
                          fixedSize: const MaterialStatePropertyAll(
                            Size.fromWidth(100),
                          ),
                          backgroundColor: MaterialStatePropertyAll(Primary)),
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)!.showSnackBar(
                          const SnackBar(
                            content: Text("Your data saved"),
                          ),
                        );
                        if (formKey.currentState!.validate()) {
                          cname = txtCname.text;
                          iname = txtIname.text;
                          rules = txtRoles.text;
                          joined = txtJoined.text;
                          exits = txtExits.text;
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              const MaterialStatePropertyAll(LinearBorder.none),
                          fixedSize: const MaterialStatePropertyAll(
                            Size.fromWidth(100),
                          ),
                          backgroundColor: MaterialStatePropertyAll(Primary)),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
