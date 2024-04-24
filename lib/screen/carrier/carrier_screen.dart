import 'package:flutter/material.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/global.dart';

class CarrierScreen extends StatefulWidget {
  const CarrierScreen({super.key});

  @override
  State<CarrierScreen> createState() => _CarrierScreenState();
}

class _CarrierScreenState extends State<CarrierScreen> {
  TextEditingController txtDesp = TextEditingController();
  TextEditingController txtCd = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (desp != null && cd != null) {
      txtDesp.text = desp!;
      txtCd.text = cd!;
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Carrier Objective",
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 4, spreadRadius: -1),
                    ],
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Career Objective",
                      style: TextStyle(
                          fontSize: 20,
                          color: Primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      controller: txtDesp,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Career Objective is required";
                        }
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: -1,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      "Current Designation(Experienced Candidate)",
                      style: TextStyle(
                          color: Primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Sofware Engineer",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      controller: txtCd,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Career Designation is required";
                        }
                      },
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Your data saved")));
                    if (fromKey.currentState!.validate()) {
                      desp = txtDesp.text;
                      cd = txtCd.text;
                    }
                    return null;
                  },
                  child: const Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    fromKey.currentState!.reset();
                  },
                  child: const Text("Clear"))
            ],
          ),
        ),
      ),
    );
  }
}
