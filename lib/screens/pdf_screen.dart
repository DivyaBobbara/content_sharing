import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/storage_io.dart';

class PDFScreen extends StatefulWidget {
  final int index;
  final String? path;
  const PDFScreen({ required this.index,this.path });

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late PdfController pdfController;
  // var url = "https://www.africau.edu/images/default/sample.pdf";
  var url = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadController();
  }
  
  void loadController() async {
    switch(widget.index) {
      case 0:
        pdfController = PdfController(document: PdfDocument.openAsset('assets/pdf/resume.pdf'));
        break;
      case 1:
        pdfController = PdfController(document: PdfDocument.openData(InternetFile.get(url)));
        break;
      case 2:
        pdfController = PdfController(document: PdfDocument.openFile(widget.path.toString()));
        break;
      default:

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () => Navigator.of(context).pop(),),
        title: Text('pdf viewer'),

      ),
      body: Center(
        child: PdfView(
          controller: pdfController,
        ),
      ),
    );
  }
}
