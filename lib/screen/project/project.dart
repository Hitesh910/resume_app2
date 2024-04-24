import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool isCprog = false;
  bool isC = false;
  bool isFlutter = false;
  TextEditingController txtProject = TextEditingController();
  TextEditingController txtRoles = TextEditingController();
  TextEditingController txtTech = TextEditingController();
  TextEditingController txtPD = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Projects",
            style: TextStyle(color: Colors.white),
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
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: [const BoxShadow(blurRadius: 2, spreadRadius: -1)],
                color: Colors.grey.shade50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project Titel",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Resume Builder App",
                      //   style: TextStyle(color: Colors.grey, fontSize: 20),
                      // ),
                      hintText: "Resume Builder App",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20)
                    ),
                    controller: txtProject,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Project Titel is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Technologies",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 35,
                  child: CheckboxListTile(
                    value: isCprog,
                    onChanged: (value) {
                      setState(
                        () {
                          isCprog = value!;
                          if (isCprog) {
                            tech1 = "C programming";
                          }
                        },
                      );
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "C programming",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: CheckboxListTile(
                    value: isC,
                    onChanged: (value) {
                      setState(
                        () {
                          isC = value!;
                          if (isC) {
                            tech2 = "C++";
                          }
                        },
                      );
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "C++",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: CheckboxListTile(
                    value: isFlutter,
                    onChanged: (value) {
                      setState(
                        () {
                          isFlutter = value!;
                          if (isFlutter) {
                            tech3 = "Flutter";
                          }
                        },
                      );
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "Flutter",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Roles",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Orgranse team member ,Code analysis",
                      //   style: TextStyle(fontSize: 18, color: Colors.grey),
                      // ),
                      hintText: "Orgranse team member ,Code analysis",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                    ),
                    controller: txtRoles,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Roles is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Technologies",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "5 - Programmers",
                      //   style: TextStyle(fontSize: 18, color: Colors.grey),
                      // ),
                      hintText: "5 - Programmers",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                    ),
                    controller: txtTech,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Technologies is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Project Description",
                  style: TextStyle(
                      color: Primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Enter Your Project Description",
                      //   style: TextStyle(fontSize: 18, color: Colors.grey),
                      // ),
                      hintText: "Enter Your Project Description",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                    ),
                    controller: txtPD,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Project Description is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                        formKey.currentState!.reset();
                        },
                        child: const Text(
                         "Clear",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                            shape: MaterialStatePropertyAll(
                              LinearBorder.start(),
                            ),
                            fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(120),
                            )),
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Your data is saved"),
                            ),
                          );
                          if (formKey.currentState!.validate()) {
                            project = txtProject.text;
                            roles = txtRoles.text;
                            tech = txtTech.text;
                            pd = txtPD.text;
                          }
                          return null;
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.blue),
                            shape: MaterialStatePropertyAll(
                              LinearBorder.start(),
                            ),
                            fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(120),
                            )),
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
