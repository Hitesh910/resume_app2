import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/utils/global.dart';
import 'package:printing/printing.dart';

void pdfCreate() async {
  var pdf = pw.Document();

  pdf.addPage(
     pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        var Icons;
        final image = pw.MemoryImage(File("$path").readAsBytesSync());
        return pw.Row(
          children: [
            pw.Container(
              width: 185,
              margin: const pw.EdgeInsets.only(right: 5),
              padding: const pw.EdgeInsets.all(15),
              color: PdfColor.fromHex("0xffd2e8e6"),
              child: pw.Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    "$name",
                    style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 25,
                        fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "$cd",
                    style: const pw.TextStyle(color: PdfColors.grey),
                  ),
                  pw.SizedBox(
                    height: 35,
                  ),
                  pw.ClipOval(
                    child: pw.Image(image, width: 100, height: 100),
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  // Contact
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 35,
                        width: 35,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromHex("0xff17aa98"),
                        ),
                        child: pw.Icon(Icons.person),
                      ),
                      pw.SizedBox(
                        width: 8,
                      ),
                      pw.Text(
                        "Conatact Me",
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 7,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Text("$mobile"),
                    ],
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Icon(
                        Icons.email,
                        size: 15,
                      ),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Text("$email"),
                    ],
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Icon(
                        Icons.location_on,
                        size: 15,
                      ),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Text("$add"),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.SizedBox(
                      width: 135,
                      child: pw.Divider(
                        color: PdfColors.black,
                      )),
                  // Eduaction
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 35,
                        width: 35,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromHex("0xff17aa98"),
                        ),
                        child: pw.Icon(Icons.book),
                      ),
                      pw.SizedBox(
                        width: 10,
                      ),
                      pw.Text(
                        "Education",
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 7,
                  ),
                  pw.Text(
                    "$college",
                    style: const pw.TextStyle(fontSize: 13),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text("$degree"),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text("$year"),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.SizedBox(
                      width: 135,
                      child: pw.Divider(
                        color: PdfColors.black,
                      )),
                  // references
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 35,
                        width: 35,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColor.fromHex("0xff17aa98"),
                        ),
                        child: pw.Icon(Icons.people_alt),
                      ),
                      pw.SizedBox(
                        width: 10,
                      ),
                      pw.Text(
                        "References",
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 7,
                  ),
                  pw.Text(
                    "$rname",
                    style: const pw.TextStyle(fontSize: 13),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text("$desg"),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text("$org"),
                  pw.SizedBox(
                    height: 4,
                  ),

                  // SizedBox(
                  //     height: 50, width: 50, child: Expanded(child: TextField())),
                ],
              ),
            ),
            pw.VerticalDivider(),
            pw.SizedBox(
              width: 10,
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                // About me
                pw.Row(
                  children: [
                    pw.Container(
                      height: 35,
                      width: 35,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: PdfColor.fromHex("0xff17aa98"),
                      ),
                      child: pw.Icon(Icons.add_alert),
                    ),
                    pw.SizedBox(
                      width: 10,
                    ),
                    pw.Text(
                      "About me",
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.Text(
                  "DOB : $dob",
                  style: const pw.TextStyle(fontSize: 13),
                ),
                pw.Text(
                  "Married Status : $marriedstatus",
                  style: const pw.TextStyle(fontSize: 13),
                ),
                pw.Text(
                  "Nationality : $nationality",
                  style: const pw.TextStyle(fontSize: 13),
                ),
                pw.SizedBox(
                  height: 12,
                ),
                pw.SizedBox(
                    width: 135,
                    child: pw.Divider(
                      color: PdfColors.black,
                    )),
              ],
            ),
          ],
        );
        //Printing.layoutPdf(onLayout: (PdfPageFormat foramt) async );
      },
    ),
  );
  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
  );
}
