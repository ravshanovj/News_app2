import 'package:news_app/provider/add_news_provider.dart';
import 'package:news_app/provider/get_news_provider.dart';
import 'package:news_app/view/screen_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GetNewsProvider(),),
    ChangeNotifierProvider(create: (context) => AddNewsProvider(),)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
