import 'package:database_project/data/model/mind_model.dart';
import 'package:database_project/view_model/minds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MindItem extends StatelessWidget {
  MindModel mind;
  MindItem({required this.mind, Key? key}) : super(key: key);

  TextEditingController mindContr = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MindsViewModel>(context);
    mindContr.text = mind.mind;
    author.text = mind.author;
    return ListTile(
      title: Text(mind.mind),
      subtitle: Text(mind.author),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Rostan ham o'chirmoqchimisiz?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Bekor qilish"),
                    ),
                    TextButton(
                        onPressed: () {
                          provider.deleteMind(mind.mind);
                          Navigator.pop(context);
                        },
                        child: const Text("Ha"))
                  ],
                ));
      },
      trailing: FittedBox(
        child: Row(
          children: [
            // IconButton(
            //   icon: const Icon(Icons.delete),
            //   color: kRedColor,
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) => AlertDialog(
            //         content: SizedBox(
            //             child: RichText(
            //           text: TextSpan(
            //               text: "Shu MIND ni o'chirasizmi:  ",
            //               style: DefaultTextStyle.of(context).style,
            //               children: [
            //                 TextSpan(
            //                     text: mindContr.text,
            //                     style: const TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20,
            //                         color: Colors.blueAccent)),
            //               ]),
            //         )),
            //         actions: [
            //           TextButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: const Text("Bekor qilish")),
            //           TextButton(
            //               onPressed: () {
            //                 provider.deleteMind(mind.mind);
            //                 Navigator.pop(context);
            //               },
            //               child: const Text("O'chirish"))
            //         ],
            //       ),
            //     );
            //   },
            // ),

            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.lightBlue,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Bekor qilish")),
                            TextButton(
                                onPressed: () {
                                  provider.updateMind(
                                      MindModel(
                                          mind: mindContr.text,
                                          author: author.text),
                                      mind.mind);
                                  Navigator.pop(context);
                                },
                                child: const Text("Yangilash")),
                          ],
                          content: SizedBox(
                            height: 160,
                            child: Column(
                              children: [
                                TextField(
                                  controller: mindContr,
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
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
