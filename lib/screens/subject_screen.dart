import 'package:content_sharing/screens/chapters_screen.dart';
import 'package:content_sharing/screens/pdf_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:power_file_view/power_file_view.dart';

class SubjectsScreen extends StatelessWidget {

  FilePickerResult? filePickerResult;
  List<Map<String, dynamic>> items = [
    {
      "subject": "physics",
      "chapters": ["Collisions", "Newton Laws", "work power"],
      "pdf": [
        "https://drive.google.com/file/d/1S1FnSG99todCs-ps_uw11iy5LqdyVVZe/view",
        "https://docs.google.com/document/d/1jYHGWXv3tR58_gDyXb2xKjBYSILCr4ig/edit",
        "https://docs.google.com/document/d/11_porJExuTDi2GhXkmRpBCR7-ncf9p-bYvUiWLEPZ1Y/edit",
        // "https://docs.google.com/spreadsheets/d/1muLSomimRcz89rsC8CP-JN6saD1G48ux/edit#gid=1392516360"
      ],
      "icons": [Icons.battery_full, Icons.scale, Icons.bolt],

    },
    {
      "subject": "chemistry",
      "chapters": ["Alkali&AlkaLine", "Isomerism", "compounds"],
      "pdf": [
        "https://docs.google.com/document/d/19TRdIJkmOVr-_xwgQuiJQyGeKHxWYkgeGh-Myd2x-Vs/edit",
        "https://docs.google.com/presentation/d/1UlxnLBqv5Tp9OwGhIZqqtGURkj5hJvSgdmVG0oYSBfo/edit#slide=id.p",
        "https://docs.google.com/spreadsheets/d/11ccvmAtaEUMWkUgNYEBo4SmQWA5Lz27FieMAVJd2B0k/edit#gid=442869633"
      ],
      "icons": [Icons.link, Icons.science, Icons.cached],

    },
    {
      "subject": "maths",
      "chapters": ["matrices", "determinants", "det"],
      "pdf": [
        "https://docs.google.com/presentation/d/1ghMcHaf563NM0DQupEltoOthKxVCtWls/edit#slide=id.p1",
        // "storage/Download/academiccalendar.pdf",
        "https://docs.google.com/spreadsheets/d/1H69HUoxhPLd9Q9u-342WnMmv8LpDlkf2/edit#gid=1193085673",
        "https://docs.google.com/document/d/1EbqvAXM3HpuNSOcAcQzRRDcf6GPI8dcUnEXETrasrL8/edit"
      ],
      "icons": [Icons.attach_money, Icons.multiline_chart, Icons.percent],

    },
  ];

  @override
  Widget build(BuildContext context) {
    final icons = [Icons.lightbulb, Icons.science, Icons.calculate];
    return Scaffold(
        appBar: AppBar(
          title: Text('subjects'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => PDFScreen(index: 0)));
                } , child: Text('assests pdf')),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => PDFScreen(index: 1)));
                } , child: Text('open url')),
                ElevatedButton(onPressed: () async {
                  filePickerResult = await FilePicker.platform.pickFiles(
                    allowedExtensions: ['pdf'],
                    type: FileType.custom,
                  );
                  if(filePickerResult != null) {
                    var path = filePickerResult!.files.single.path;
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => PDFScreen(index: 2,path: path,)));

                  }

                } , child: Text('open file')),
              ],
            ),),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, ind) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(icons[ind]),
                    ),
                    title: Text(items[ind]['subject']),
                    onTap: () {
                      // if (items[ind]['fileType'] == 'url') {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return ChapterListScreen(items[ind]['chapters'],
                              items[ind]['pdf'], items[ind]['icons']);
                        }));
                      // }

                    }
                  );
                },
                itemCount: items.length,
              ),
            ),
          ],
        ));
  }
}
