
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '';

import 'dart:io';
class ChapterListScreen extends StatelessWidget {
  final List<String> chapters;
  final List<String> pdfs;
  final List<IconData> icons;


  const ChapterListScreen(this.chapters,this.pdfs,this.icons);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chapters'),),
      body: ListView.builder(itemBuilder: (ctx,ind) {
              return ListTile(leading:CircleAvatar(child: Icon(icons[ind]),),title:Text( chapters[ind]),onTap: () async {
                final url = pdfs[ind];
                if (url.startsWith('http')) {
                  print("$url urlll");
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrlString(url,mode: LaunchMode.inAppWebView);
                  } else {
                    throw 'Could not launch $url';
                  }
                }
              }
              ,);
          },itemCount: chapters.length,),
    );
  }
}
