import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/provider/add_news_provider.dart';
import 'package:provider/provider.dart';

class AddNewsPage extends StatefulWidget {
  const AddNewsPage({super.key});

  @override
  State<AddNewsPage> createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  @override
  Widget build(BuildContext context) {
    AddNewsProvider provider = Provider.of<AddNewsProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AddNewsProvider(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(title: const Text("Add News")),
            body: Column(
              children: [
                TextFormField(
                    controller: provider.titleController,
                    decoration: InputDecoration(
                        labelText: "Title",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                TextFormField(
                    controller: provider.subtitleController,
                    decoration: InputDecoration(
                        labelText: "Subtitle",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )))
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  provider.addNews();
                },
                label: const Text("Add")));
      },
    );
  }
}
