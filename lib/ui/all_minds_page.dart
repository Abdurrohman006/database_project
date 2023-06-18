import 'package:database_project/view_model/minds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/mind_item.dart';

class AllMindsPage extends StatefulWidget {
  const AllMindsPage({Key? key}) : super(key: key);

  @override
  State<AllMindsPage> createState() => _AllMindsPageState();
}

class _AllMindsPageState extends State<AllMindsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MindsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Minds Page "),
      ),
      body: Consumer<MindsViewModel>(
        builder: (context, value, child) {
          if (value.minds == null) {
            provider.readMinds();
          } else if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: value.minds!.length,
              itemBuilder: (context, index) {
                var mind = value.minds![index];
                return MindItem(mind: mind);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
