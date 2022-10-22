import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';

class SenderReportPage extends StatefulWidget {
  @override
  State<SenderReportPage> createState() => _SenderReportPageState();
}

class _SenderReportPageState extends State<SenderReportPage> {
  String selectedFolder = 'Отчеты о перевозках';

  List<DocumentationPiece> docsList = [];
  List<String> currentFolder = [];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String folder in foldersList) {
      var newItem = DropdownMenuItem(
        child: Text(
          folder,
          style: TextStyle(fontSize: 15.0),
        ),
        value: folder,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      dropdownColor: Colors.blue,
      value: selectedFolder,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          if (value == 'Отчеты о перевозках') {
            docsList.clear();
            currentFolder = transportReportList;
          } else if (value == 'Отчеты по компаниям') {
            docsList.clear();
            currentFolder = companyReportList;
          } else if (value == 'Разное') {
            docsList.clear();
            currentFolder = stuffFolder;
          }
          selectedFolder = value!;
        });
      },
    );
  }

  @override
  void initState() {
    currentFolder = transportReportList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: kMainThemeColor1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.report,
                        size: 100.0,
                        color: kElementsColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          height: 45.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: androidDropdown(),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentFolder.length,
                      itemBuilder: (BuildContext context, int index) {
                        for (var doc in currentFolder) {
                          final docPiece = DocumentationPiece(
                            title: doc,
                            onTapDoc: () {},
                            onTapPdf: () {},
                          );
                          docsList.add(docPiece);
                        }
                        return docsList[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentationPiece extends StatelessWidget {
  DocumentationPiece(
      {required this.title, required this.onTapDoc, required this.onTapPdf});

  final String title;
  final VoidCallback onTapDoc;
  final VoidCallback onTapPdf;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
              bottom: Radius.circular(20.0),
            ),
            elevation: 8.0,
            child: Container(
              width: 200.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0), bottom: Radius.circular(20.0)),
                color: Colors.orangeAccent,
              ),
              child: Center(
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onTapPdf,
              icon: Icon(
                Icons.picture_as_pdf,
                size: 40.0,
                color: Colors.red,
              ),
            ),
            maxRadius: 30.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onTapDoc,
              icon: Icon(
                Icons.save_as,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            maxRadius: 30.0,
          ),
        ],
      ),
    );
  }
}
