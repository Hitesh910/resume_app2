import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/utils/global.dart';
import 'package:resume_app/utils/pdf_helper.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume"),
      ),
      body:
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Image.file(
          //             File("$path"),
          //             height: 100,
          //             width: 100,
          //             fit: BoxFit.cover,
          //           ),
          //           Text("$name"),
          //         ],
          //       ),
          //     ),
          //     Divider(),
          //     Text("$email"),
          //     Text("$mobile"),
          //     Text("$add"),
          //     Text("$desp"),
          //     Text("$cd"),
          //     Text("$dob"),
          //     Text("$nationality"),
          //     Text("$degree"),
          //     Text("$college"),
          //     Text("$marks"),
          //     Text("$year"),
          //     Text("$marriedstatus"),
          //     Column(
          //       children: List.generate(
          //         dataList.length,
          //         (index) => Text(dataList[index]),
          //       ),
          //     ),
          //     Text("$despc"),
          //     Text("$date"),
          //     Text("$place"),
          //     Text("$project"),
          //     Text("$tech1"),
          //     Text("$tech2"),
          //     Text("$tech3"),
          //     Text("$roles"),
          //     Text("$tech"),
          //     Text("$pd"),
          //   ],
          // ),
          Row(
            children: [
          Container(
            width: 200,
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(15),
            color: const Color(0xffd2e8e6),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$name",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$cd",
                  style: const TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 35,
                ),
                CircleAvatar(
                  child: Image.file(File("$path")),
                  radius: 70,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Contact
                Row(
                  children: [
                    Container(
                  height: 35,width: 35
                      ,decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff17aa98),),
                      child: const Icon(Icons.person),),
                    // Image.file(
                    //   File("$path "),
                    //   height: 100,
                    //   width: 100,
                    //   fit: BoxFit.cover,
                    // ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Conatact Me",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone,size: 15,),
                    const SizedBox(width: 5,),
                    Text("$mobile"),
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email,size: 15,),
                    const SizedBox(width: 5,),
                    Text("$email"),
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on,size: 15,),
                    const SizedBox(width: 5,),
                    Text("$add"),
                  ],
                ),
                const SizedBox(height: 10,),
                const SizedBox(
                    width: 135,child: Divider(color: Colors.black,)),
                // Eduaction
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      height: 35,width: 35
                      ,decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff17aa98),),
                      child: const Icon(Icons.book),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                     "Education",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 7,),
                Text("$college",style: const TextStyle(fontSize: 13),),
                const SizedBox(height: 4,),
                Text("$degree"),
                const SizedBox(height: 4,),
                Text("$year"),
                const SizedBox(height: 4,),
                const SizedBox(
                    width: 135,child: Divider(color: Colors.black,)),
                // references
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      height: 35,width: 35
                      ,decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff17aa98),),
                      child: const Icon(Icons.people_alt),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                     "References",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 7,),
                Text("$rname",style: const TextStyle(fontSize: 13),),
                const SizedBox(height: 4,),
                Text("$desg"),
                const SizedBox(height: 4,),
                Text("$org"),
                const SizedBox(height: 4,),



                // SizedBox(
                //     height: 50, width: 50, child: Expanded(child: TextField())),
              ],
            ),
          ),

              VerticalDivider(),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // About me
                  Row(
                    children: [
                      Container(
                        height: 35,width: 35
                        ,decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff17aa98),),
                        child: const Icon(Icons.add_alert),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                       "About me",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 7,),
                  Text("DOB : $dob",style: const TextStyle(fontSize: 13),),
                  Text("Married Status : $marriedstatus",style: const TextStyle(fontSize: 13),),
                  Text("Nationality : $nationality",style: const TextStyle(fontSize: 13),),
                  const SizedBox(height: 12,),
                  const SizedBox(
                      width: 135,child: Divider(color: Colors.black,)),
                ],
              ),

                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pdfCreate();
          });
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
