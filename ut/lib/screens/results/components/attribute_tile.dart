import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import '../../../constants.dart';
import 'package:pdf/widgets.dart' as pw;

class AttributeDetailsTile extends StatelessWidget {
  const AttributeDetailsTile({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Color(0xFFF5F6F9),
        shadowColor: kPrimaryColor,
        elevation: 20,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Divider(),
            SizedBox(width: 12),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: kPrimaryLightColor),
            ),
          ],
        ),
      ),
    );
  }
}

pw.Widget tilePdf({String? title, String? value}) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: pw.Container(
      color: PdfColors.getColor(0xFFF5F6F9),
      child: pw.Column(
        children: [
          pw.Text(
            title!,
            style: pw.TextStyle(
                fontSize: 16, color: PdfColors.getColor(kPrimaryColor.value)),
          ),
          pw.Divider(),
          pw.SizedBox(width: 12),
          pw.Text(
            value!,
            style: pw.TextStyle(
                fontSize: 14,
                color: PdfColors.getColor(kPrimaryLightColor.value)),
          ),
        ],
      ),
    ),
  );
}
