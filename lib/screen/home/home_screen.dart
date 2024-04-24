import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_app/screen/contact/contact_screen.dart';
import 'package:resume_app/utils/app_color.dart';
import 'package:resume_app/utils/app_routes.dart';
import 'package:resume_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Primary,
        title: const Text("Resume Workspace"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Container(
            padding: const EdgeInsets.only(bottom: 22),
            alignment: Alignment.center,
            child: const Text(
              "Build Option",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            tileList.length,
            (index) {
              return Tile(
                  label: tileList[index]['name'],
                  icons: tileList[index]['icon'],
                  routes: tileList[index]['routes']);
            },
          ),
        ),
      ),
    );
  }
  Widget Tile(
      {required String label,
      required IconData icons,
      required String routes}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,"$routes");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  icons,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "$label",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
