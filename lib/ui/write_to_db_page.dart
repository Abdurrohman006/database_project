import 'package:database_project/data/model/mind_model.dart';
import 'package:database_project/ui/all_minds_page.dart';
import 'package:database_project/view_model/minds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteDbPage extends StatelessWidget {
  WriteDbPage({Key? key}) : super(key: key);
  TextEditingController mind = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MindsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write to db page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllMindsPage(),
                    ));
              },
              icon: const Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: mind,
              decoration: const InputDecoration(
                label: Text("Quote"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: author,
              decoration: const InputDecoration(
                label: Text("Author"),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          provider.addMind(MindModel(mind: mind.text, author: author.text));
          // LocalDatabase().addMind(MindModel(mind: mind.text, author: author.text));
        },
      ),
    );
  }
}
