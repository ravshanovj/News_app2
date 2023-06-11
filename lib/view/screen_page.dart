import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/loading_widget.dart';
import 'package:news_app/provider/get_news_provider.dart';
import 'package:news_app/view/add_news_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetNewsProvider provider = Provider.of<GetNewsProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => GetNewsProvider(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("News page"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddNewsPage(),
                          ));
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: Builder(
              builder: (context) {
                if (provider.isLoading) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                } else if (provider.error.isNotEmpty) {
                  return Center(
                    child: Text(provider.error.toString()),
                  );
                } else {
                  return ListView.builder(
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            provider.data[index].title.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ));
      },
    );
  }
}
