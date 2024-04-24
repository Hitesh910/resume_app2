import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({super.key});

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  TextEditingController txtRname = TextEditingController();
  TextEditingController txtDesg = TextEditingController();
  TextEditingController txtOrg = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Refrences",
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
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [const BoxShadow(blurRadius: 5, spreadRadius: -1)],
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reference Name",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Suresh Shah",
                      //   style: TextStyle(color: Colors.grey, fontSize: 18),
                      // ),
                      hintText: "Suresh Shah",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    controller: txtRname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Reference name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Designation",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Suresh Shah",
                      //   style: TextStyle(color: Colors.grey, fontSize: 18),
                      // ),
                      hintText: "Marketing Manager,ID-342332",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Designation is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Organization/Institute",
                  style: TextStyle(
                    color: Primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // label: Text(
                      //   "Suresh Shah",
                      //   style: TextStyle(color: Colors.grey, fontSize: 18),
                      // ),
                      hintText: "Green Energy Pvt.ltd",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Organization name is required";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                      },
                      child: Text("Clear"),
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(content: Text("Your data saved"),),);
                        if(formKey.currentState!.validate())
                          {
                            rname= txtRname.text;
                            desg = txtDesg.text;
                             org = txtOrg.text;
                          }
                      },
                      child: Text("Save"),
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
