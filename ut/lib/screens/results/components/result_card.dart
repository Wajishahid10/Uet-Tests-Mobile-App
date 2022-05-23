import 'dart:convert';
import 'dart:io'; // for File

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uet_tests/database/Cart.dart';
import 'package:uet_tests/database/models.dart';
import 'package:uet_tests/screens/profile/components/profile_menu.dart';
import 'package:uet_tests/screens/results/components/attribute_tile.dart';

import 'package:uet_tests/components/default_button.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../constants.dart';
import '../../../size_config.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.totalResult,
  }) : super(key: key);

  final List<Object> totalResult;

  @override
  Widget build(BuildContext context) {
    Test test = totalResult[1] as Test;
    Result result = totalResult[0] as Result;
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.memory(
                (base64Decode(
                  test.Image,
                )),
              ),
              //      child: Image.asset('assets/images/lpl1.jpg'),
              /** 
              child: Image.memory(
                (base64Decode(
                  json.decode(Result.Image),
              )),
              ),
              */
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                test.testName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                    result.ResultDescription,
                  ),
                ],
              ),
              SizedBox(height: 5),
              result.Details.length == 0
                  ? Center(
                      child: Text('No Reults at the Moment'),
                    )
                  : SizedBox(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.8,
                      child: ListView.builder(
                        itemCount: result.Details.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map<String, dynamic> detailsMap = result.Details;

                          final titles = detailsMap.keys.toList();
                          final values = detailsMap.values.toList();

                          return AttributeDetailsTile(
                            title: titles[index],
                            value: values[index],
                          );
                        },
                      ),
                    ),
              DefaultButton(
                text: 'Save Result',
                press: () async {
                  final pdf = pw.Document();

                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Row(
                          children: [
                            pw.SizedBox(
                              width: 88,
                              child: pw.AspectRatio(
                                aspectRatio: 0.88,
                                child: pw.Container(
                                  padding: pw.EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: pw.BoxDecoration(
                                    color: PdfColors.getColor(0xFFF5F6F9),
                                    borderRadius: pw.BorderRadius.circular(15),
                                  ),
                                  child: pw.Container(),
                                  /** 
                                  pw.Image(
                                    pw.MemoryImage(
                                      (base64Decode(
                                        test.Image,
                                      )),
                                    ),
                                  ),
                                   */
                                ),
                              ),
                            ),
                            pw.SizedBox(width: 20),
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    test.testName,
                                    style: pw.TextStyle(
                                        color: PdfColors.black, fontSize: 16),
                                    maxLines: 2,
                                    overflow: pw.TextOverflow.clip,
                                  ),
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildTextPdf(
                                        result.ResultDescription,
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 5),
                                  result.Details.length == 0
                                      ? pw.Center(
                                          child: pw.Text(
                                              'No Reults at the Moment'),
                                        )
                                      : pw.SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.18,
                                          width: SizeConfig.screenWidth * 0.8,
                                          child: pw.ListView.builder(
                                            itemCount: result.Details.length,
                                            itemBuilder: (pw.Context context,
                                                int index) {
                                              Map<String, dynamic> detailsMap =
                                                  result.Details;

                                              final titles =
                                                  detailsMap.keys.toList();
                                              final values =
                                                  detailsMap.values.toList();

                                              return tilePdf(
                                                title: titles[index],
                                                value: values[index],
                                              );
                                            },
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ); // Center
                      })); //
                  final directory = (await getExternalStorageDirectories(
                          type: StorageDirectory.downloads))!
                      .first;

                  File file =
                      File("${directory.path}/OrderID:${result.Order_ID}.pdf");
                  await file.writeAsBytes(await pdf.save()).then((value) =>
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('File Saved'))));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

bool isReadmore = false;

Widget buildText(String text) {
  // if read more is false then show only 3 lines from text
  // else show full text
  final lines = isReadmore ? null : 3;
  return Text(
    text, style: TextStyle(color: kTextColor),
    maxLines: lines,
    // overflow properties is used to show 3 dot in text widget
    // so that user can understand there are few more line to read.
    overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
  );
}

bool isReadmorePdf = false;

pw.Widget buildTextPdf(String text) {
  // if read more is false then show only 3 lines from text
  // else show full text
  final lines = isReadmorePdf ? null : 3;
  return pw.Text(
    text, style: pw.TextStyle(color: PdfColors.getColor(kTextColor.value)),
    maxLines: lines,
    // overflow properties is used to show 3 dot in text widget
    // so that user can understand there are few more line to read.
    overflow: isReadmorePdf ? pw.TextOverflow.visible : pw.TextOverflow.span,
  );
}
