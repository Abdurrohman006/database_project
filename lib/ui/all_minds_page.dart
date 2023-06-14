import 'package:database_project/view_model/minds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllMindsPage extends StatelessWidget {
  const AllMindsPage({Key? key}) : super(key: key);

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
            return const Center(child: Text("data bor"));
          }
          return Container();
        },
      ),
    );
  }
}
