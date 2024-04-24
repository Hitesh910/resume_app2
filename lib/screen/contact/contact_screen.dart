import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/utils/global.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int indexKey = 0;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  GlobalKey<FormState> formeKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if(name!=null && email!=null && mobile!=null && add!=null)
      {
        txtName.text = name!;
        txtEmail.text = email!;
        txtMobile.text = mobile!;
        txtAdd.text = add!;
      }
  }

  Widget build(BuildContext context) {
    return Form(
      key: formeKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffededed),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue,
            title: const Text(
              "Resume Workspace",
              style: TextStyle(fontSize: 25),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          indexKey = 0;
                        });
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.amber,
                                    width: (indexKey == 0) ? 3 : 0))),
                        child: const Text(
                          "Contact",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          indexKey = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.amber,
                                    width: (indexKey == 1) ? 3 : 0))),
                        child: const Text(
                          "Photo",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: IndexedStack(
            index: indexKey,
            children: [
              Container(
                height: 600,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("name"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        textInputAction: TextInputAction.next,
                        controller: txtName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email)),
                        textInputAction: TextInputAction.next,
                        controller: txtEmail,
                        validator: (value) {
                          if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value!)) {
                            return "Email is required";
                          } else if (value!.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Mobile"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        textInputAction: TextInputAction.next,
                        controller: txtMobile,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (value.length != 10) {
                            return "Enter validate number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                          label: Text("Address (Street,Building no)"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        controller: txtAdd,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your data saved")));
                          if (formeKey.currentState!.validate()) {
                            name = txtName.text;
                            email = txtEmail.text;
                            mobile = txtMobile.text;
                            add = txtAdd.text;
                            print("$name, $email , $mobile , $add ");
                          } else {
                            return null;
                          }
                        },
                        child: const Text("submit"),

                      ),
                      ElevatedButton(
                        onPressed: () {
                          formeKey.currentState!
                              .reset();
                        },
                        child: const Text("clear"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                alignment: Alignment.center,
                color: Colors.white,
                margin: const EdgeInsets.all(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    (path == null)
                        ? const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.green,
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage: FileImage(File("$path")),
                          ),
                    Align(
                      alignment: const Alignment(0.3, 0.5),
                      child: IconButton.filledTonal(
                          // style: ButtonStyle(
                          //     backgroundColor:
                          //         MaterialStateProperty.all(Colors.cyan)),
                          onPressed: () async {
                            XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              path = image!.path;
                            });
                          },
                          icon: const Icon(Icons.add)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
