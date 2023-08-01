import 'dart:io';

import 'package:assignment_app/models.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ResultPage extends StatefulWidget {
  final ApiResult apiResult;
  const ResultPage({super.key, required this.apiResult});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future saveData(String data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/apiResult.json');
    print("Saved file to ${directory}");
    await file.writeAsString(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Result"),
        actions: [Text("Total count : ${widget.apiResult.count}")],
      ),
      body: ListView.builder(
        itemCount: widget.apiResult.count,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(widget.apiResult.entries[index].api),
            subtitle: Text(widget.apiResult.entries[index].description),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await saveData(widget.apiResult.toString());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Data saved locally")));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
